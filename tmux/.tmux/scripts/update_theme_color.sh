#!/usr/bin/env bash
# Set @theme_color from TMUX_THEME_COLOR env var, default to lavender
color="${TMUX_THEME_COLOR:-#b294bb}"
tmux set -g @theme_color "$color"
