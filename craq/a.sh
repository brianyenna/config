# IFS=$'\n' read -ra host_names_array <<< "$(cat test.txt)"

# for host_name in "${host_names_array[@]}"; do
#     echo ${host_name}
# done

# IFS=$'\n\t,; '
# for country in $(cat test.txt)
# do
#     echo $(echo ${country} | tr -d '[:space:]')
# done

CURRENT_TMUX_SESSION_NAME=$(tmux display-message -p '#S')
MULTI_SSH_TMUX_WINDOW_NAME="multi_ssh_${RANDOM}"
tmux new-window -d -t ${CURRENT_TMUX_SESSION_NAME} -n ${MULTI_SSH_TMUX_WINDOW_NAME}
tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}
tmux split-window -v -t ${CURRENT_TMUX_SESSION_NAME}:${MULTI_SSH_TMUX_WINDOW_NAME}

tmux select-layout tiled
