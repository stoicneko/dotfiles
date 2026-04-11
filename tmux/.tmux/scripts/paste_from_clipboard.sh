#!/usr/bin/env bash
# Paste from system clipboard (WSL2 / X11 / macOS)
if command -v powershell.exe &>/dev/null; then
  # WSL2: use PowerShell to get clipboard
  content=$(powershell.exe -NoProfile -Command 'Get-Clipboard' 2>/dev/null | tr -d '\r')
elif command -v xclip &>/dev/null; then
  content=$(xclip -selection clipboard -o 2>/dev/null)
elif command -v xsel &>/dev/null; then
  content=$(xsel --clipboard --output 2>/dev/null)
elif command -v pbpaste &>/dev/null; then
  content=$(pbpaste 2>/dev/null)
else
  tmux display-message "No clipboard tool found"
  exit 1
fi

# Use tmux's built-in bracket paste to safely insert content
tmux set-buffer "$content"
tmux paste-buffer
