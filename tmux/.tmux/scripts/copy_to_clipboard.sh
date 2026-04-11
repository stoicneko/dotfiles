#!/usr/bin/env bash
# Copy to system clipboard (WSL2 / X11 / macOS)
# Used by tmux copy-pipe: receives selection on stdin
if command -v clip.exe &>/dev/null; then
  # WSL2
  cat | clip.exe
elif command -v xclip &>/dev/null; then
  cat | xclip -selection clipboard
elif command -v xsel &>/dev/null; then
  cat | xsel --clipboard --input
elif command -v pbcopy &>/dev/null; then
  cat | pbcopy
fi
