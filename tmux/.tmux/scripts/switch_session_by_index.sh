#!/usr/bin/env bash
# Switch to session by its position index (1-based)
target_index="${1:?Usage: switch_session_by_index.sh <index>}"
session_name=$(tmux list-sessions -F '#S' 2>/dev/null | sed -n "${target_index}p")
if [ -n "$session_name" ]; then
  tmux switch-client -t "$session_name"
fi
