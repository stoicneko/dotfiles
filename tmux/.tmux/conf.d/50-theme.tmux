# Theme: dynamic color + status bar + pane borders

# -- dynamic theme color
# Set TMUX_THEME_COLOR env var before launching tmux to customize.
# Default: #b294bb (lavender)
run-shell "~/.tmux/scripts/update_theme_color.sh"

# -- pane borders
setw -g pane-border-status top
set -g pane-active-border-style "fg=#{@theme_color}"
set -g pane-border-style fg=colour244

# pane border format: show pane title / current command
setw -g pane-border-format '\
#{?pane_active,\
 #[fg=#{@theme_color}]#[bg=#{@theme_color}]#[fg=#1d1f21,bold] #{?window_zoomed_flag,Z ,}#T (#P) #[bg=default]#[fg=#{@theme_color}]#[default],\
 #[fg=colour244]#[bg=colour244]#[fg=#1d1f21] #{?window_zoomed_flag,Z ,}#T (#P) #[bg=default]#[fg=colour244]#[default]\
}'

# -- status bar
set -g status on
set -g status-interval 1
set -g status-position top
set -g status-justify left
set -g status-left-length 90
set -g status-right-length 150
setw -g window-status-separator ''

# status bar colors
set -g status-bg '#1d1f21'
set -g status-style "bg=#1d1f21"

# left: session name with prefix indicator
set -g status-left "\
#[fg=#1d1f21,bg=#{@theme_color},bold] #{?client_prefix,^ ,} #S \
#[fg=#{@theme_color},bg=#1d1f21]   "

# right: continuum status + date + time
set -g status-right "\
#[fg=#504945,bg=#1d1f21]\
#[fg=#a89984,bg=#504945] %a %b %d \
#[fg=#1d1f21] \
#[fg=#a89984] %H:%M \
#[fg=#{@theme_color},bg=#504945]\
#[fg=#1d1f21,bg=#{@theme_color},bold] #{continuum_status} "

# window format: name + markers
setw -g window-status-format '\
#[fg=#a89984,bg=#1d1f21] #I:#W\
#{?#{==:#{@unread},1}, *,}\
#{?#{==:#{@watching},1}, !,} '

setw -g window-status-current-format '\
#[fg=#{@theme_color},bg=#1d1f21,bold] #I:#W\
#{?window_zoomed_flag, Z,}\
#{?#{==:#{@unread},1}, *,}\
#{?#{==:#{@watching},1}, !,} '

setw -g window-status-activity-style "bg=#1d1f21"
setw -g window-status-bell-style "bg=#1d1f21"

# message style
set -g message-style "fg=#{@theme_color},bg=#504945"
set -g message-command-style "fg=#{@theme_color},bg=#504945"
