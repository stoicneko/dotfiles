#!/usr/bin/env bash
# Swap current window left or right within the session
direction="${1:-right}"
current=$(tmux display-message -p '#I')
if [ "$direction" = "left" ]; then
  target=$((current - 1))
  [ "$target" -lt 1 ] && exit 0
else
  # Get the last window index
  last=$(tmux list-windows -F '#I' | tail -1)
  target=$((current + 1))
  [ "$target" -gt "$last" ] && exit 0
fi
tmux swap-window -s "$current" -t "$target"
tmux select-window -t "$target"
