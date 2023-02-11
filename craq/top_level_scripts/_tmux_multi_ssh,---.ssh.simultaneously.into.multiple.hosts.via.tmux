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
for host_name in $(cat ${TEMP_FILE})
do
    # Strip the hostname of any whitespace characters
    cleaned_host_name=$(echo ${host_name} | tr -d '[:space:]')

    # Check that the cleaned host name string is non-zero
    if [ -n "${cleaned_host_name}" ]; then
        echo "${cleaned_host_name}"
        # Create a new pane
        tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
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
