#!/usr/bin/env bash
# Toggle pane layout between horizontal and vertical split
layout=$(tmux display-message -p '#{window_layout}')
if echo "$layout" | grep -q '\[.*x.*\].*,.*\[.*x.*\]'; then
  # Try to toggle between even-horizontal and even-vertical
  current=$(tmux display-message -p '#{window_layout}' | head -c4)
  tmux select-layout even-vertical 2>/dev/null || tmux select-layout even-horizontal 2>/dev/null
else
  tmux next-layout
fi
