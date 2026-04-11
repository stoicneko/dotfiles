# Core terminal and session defaults

# -- terminal
set -g default-terminal "tmux-256color"
set -as terminal-features ",*256col*:RGB"
set -as terminal-overrides ",*256col*:Tc"
setw -g xterm-keys on
set -s extended-keys on
set -as terminal-features 'xterm*:extkeys'

# -- general behavior
set -s escape-time 0
set -sg repeat-time 300
set -s focus-events on
set -g mouse on
set -sg exit-empty on
set -g detach-on-destroy off
set -g allow-passthrough on
set -g set-clipboard on
set -g history-limit 50000

# -- utf8
set -q -g status-utf8 on
setw -q -g utf8 on

# -- activity (silent)
set -g visual-activity off
setw -g monitor-activity off
setw -g monitor-bell off

# -- indexing
set -g base-index 1
setw -g pane-base-index 1
setw -g automatic-rename on
set -g renumber-windows on
set -g set-titles on

# -- display timing
set -g display-panes-time 2000
set -g display-time 2000

# -- shell
if-shell 'test -e /usr/bin/fish' {
  set -g default-shell /usr/bin/fish
}
if-shell 'test -e /usr/local/bin/fish' {
  set -g default-shell /usr/local/bin/fish
}

# -- reload config
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

# -- pass through environment variables on reattach
set -ga update-environment '\
DISPLAY DBUS_SESSION_BUS_ADDRESS \
XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME \
XDG_RUNTIME_DIR XDG_SESSION_TYPE XDG_CURRENT_DESKTOP \
FZF_DEFAULT_OPTS \
TMUX_THEME_COLOR \
TERM TERM_PROGRAM \
'
