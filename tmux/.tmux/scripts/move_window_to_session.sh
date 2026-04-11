#!/usr/bin/env bash
# Move current window to session by position index (1-based)
target_index="${1:?Usage: move_window_to_session.sh <index>}"
session_name=$(tmux list-sessions -F '#S' 2>/dev/null | sed -n "${target_index}p")
if [ -n "$session_name" ]; then
  tmux move-window -t "$session_name:"
fi
