#!/usr/bin/env bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

if tmux ls | grep -q "iris_session"; then
  dunstify "Tmux ession running in background" "Attaching" -r 1312
  tmux attach
else
  dunstify "No tmux session running" "Starting new instance" -r 1312
  tmux new-session -d -s iris_session -n nix
  tmux send-keys -t iris_ses "cd ~/.config/NixosFlakes" C-m
  tmux send-keys -t iris_ses "clear" C-m
  tmux new-window -t iris_ses -n code
  tmux send-keys -t iris_ses "clear" C-m
  tmux select-window -t code
  tmux attach-session -t iris_ses
 fi
