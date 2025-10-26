# Core terminal and session defaults
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set -gq allow-passthrough on

set -g base-index 1
set -g pane-base-index 1
set -g renumber-windows on

set -g mouse on
