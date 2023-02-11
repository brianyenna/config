#!/usr/bin/env bash

# Create a temporary file
TEMP_FILE=$(mktemp)

# Open editor for user to enter list of hosts to SSH into
${EDITOR} ${TEMP_FILE}

# Create a new tmux window within the current session
CURRENT_TMUX_SESSION_NAME=$(tmux display-message -p '#S')
MULTI_SSH_TMUX_WINDOW_NAME="multi_ssh_${RANDOM}"
tmux new-window -t ${CURRENT_TMUX_SESSION_NAME} -n ${MULTI_SSH_TMUX_WINDOW_NAME}

# Iterate through the host_names in the TEMP_FILE
OLD_IFS=${IFS}
IFS=$'\n\t,; '
IS_FIRST_HOST=1 # Use the first pane (created when window was first created)
echo "SSH-ing into the following hosts:"
for host_name in $(cat ${TEMP_FILE})
do
    # Strip the hostname of any whitespace characters
    cleaned_host_name=$(echo ${host_name} | tr -d '[:space:]')

    # Check that the cleaned host name string is non-zero
    if [ -n "${cleaned_host_name}" ]; then
        echo "- ${cleaned_host_name}"
       
        if [ ${IS_FIRST_HOST} -eq 1 ]; then
            # Do not create a new pane for the first host.
            # Just re-use the first pane (created when window was first created)
            IS_FIRST_HOST=0
        else
            # Create a new pane
            tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
        fi

        # Send command to tmux pane
        tmux send-keys "echo ${cleaned_host_name}" Enter
    fi
done

# Adjust tiling of the newly-created panes
tmux select-layout -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME} tiled

# Clean up
# Reset IFS
IFS=${OLD_IFS}

# Delete the temporary file
rm ${TEMP_FILE}

# TODO: Provide a way to configure env variables? --> programmatically do this and provide a rich TUI
