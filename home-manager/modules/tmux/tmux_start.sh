# Start a new detached tmux session named GFG_Session
tmux new-session -d -s iris -n Code
tmux new-window -t iris -n Dots
tmux send-keys -t iris "cd ./.config/nix-flaked" C-m
tmux send-keys -t iris "clear" C-m
tmux select-window -t Code
tmux select-pane -t 1

# Attach to the tmux session
tmux attach-session -t iris
