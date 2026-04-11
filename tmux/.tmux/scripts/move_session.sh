#!/usr/bin/env bash
# Navigate between sessions: left (previous) or right (next)
direction="${1:-right}"
if [ "$direction" = "left" ]; then
  tmux switch-client -p
else
  tmux switch-client -n
fi
