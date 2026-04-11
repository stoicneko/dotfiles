# Keybindings — QWERTY layout
# Adapted from theniceboy's Colemak config: n/e/u/i -> h/j/k/l

# ─── Prefix ──────────────────────────────────────────────────────
unbind C-b
set -g prefix 'C-s'

set -g status-keys emacs
set -g mode-keys vi

# ─── Session ─────────────────────────────────────────────────────
bind C-c new-session
bind -n M-S new-session -c "#{pane_current_path}"
bind . command-prompt -p "Rename session to:" "rename-session '%%'"
bind W choose-tree -Z
bind S choose-tree 'move-pane -v -s "%%"'
bind V choose-tree 'move-pane -h -s "%%"'

# switch session by index: Ctrl+1~9
bind -n C-1 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 1"
bind -n C-2 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 2"
bind -n C-3 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 3"
bind -n C-4 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 4"
bind -n C-5 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 5"
bind -n C-6 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 6"
bind -n C-7 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 7"
bind -n C-8 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 8"
bind -n C-9 run-shell -b "~/.tmux/scripts/switch_session_by_index.sh 9"

# move window to session by index: prefix + 1~9, 0
bind 1 run-shell "~/.tmux/scripts/move_window_to_session.sh 1"
bind 2 run-shell "~/.tmux/scripts/move_window_to_session.sh 2"
bind 3 run-shell "~/.tmux/scripts/move_window_to_session.sh 3"
bind 4 run-shell "~/.tmux/scripts/move_window_to_session.sh 4"
bind 5 run-shell "~/.tmux/scripts/move_window_to_session.sh 5"
bind 6 run-shell "~/.tmux/scripts/move_window_to_session.sh 6"
bind 7 run-shell "~/.tmux/scripts/move_window_to_session.sh 7"
bind 8 run-shell "~/.tmux/scripts/move_window_to_session.sh 8"
bind 9 run-shell "~/.tmux/scripts/move_window_to_session.sh 9"
bind 0 run-shell "~/.tmux/scripts/move_window_to_session.sh 10"

# navigate sessions: prefix + [ / ]
bind [ run-shell "~/.tmux/scripts/move_session.sh left"
bind ] run-shell "~/.tmux/scripts/move_session.sh right"

# ─── Window ──────────────────────────────────────────────────────
# new window at current path
bind -n M-o new-window -a -c "#{pane_current_path}"
bind , command-prompt -p "Rename window:" "rename-window '%%'"

# window navigation: Alt+1~9
unbind n
unbind p
bind -r C-p previous-window
bind -r C-n next-window

bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4
bind -n M-5 select-window -t 5
bind -n M-6 select-window -t 6
bind -n M-7 select-window -t 7
bind -n M-8 select-window -t 8
bind -n M-9 select-window -t 9

# prev/next window: Alt+[ / Alt+]
bind -n M-[ previous-window
bind -n M-] next-window

# swap window position: Alt+Shift+{ / }
bind -n M-'{' run-shell "bash ~/.tmux/scripts/swap_window.sh left"
bind -n M-'}' run-shell "bash ~/.tmux/scripts/swap_window.sh right"

# join pane to window: Alt+Shift+1~9
bind -n M-! join-pane -t :1
bind -n M-@ join-pane -t :2
bind -n 'M-#' join-pane -t :3
bind -n 'M-$' join-pane -t :4
bind -n M-% join-pane -t :5
bind -n M-^ join-pane -t :6
bind -n M-& join-pane -t :7
bind -n M-* join-pane -t :8
bind -n M-( join-pane -t :9

bind -n M-Q kill-pane
bind -n M-O break-pane

# ─── Pane ────────────────────────────────────────────────────────
# split panes at current path (prefix + h/j/k/l = left/down/up/right)
bind k split-window -v -b -c "#{pane_current_path}"
bind j split-window -v -c "#{pane_current_path}"
bind h split-window -h -b -c "#{pane_current_path}"
bind l split-window -h -c "#{pane_current_path}"

# pane navigation: Alt+h/j/k/l
# Smart pane switching with awareness of Vim splits (vim-tmux-navigator)
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
bind -n M-h if-shell "$is_vim" 'send-keys M-h' 'select-pane -L'
bind -n M-j if-shell "$is_vim" 'send-keys M-j' 'select-pane -D'
bind -n M-k if-shell "$is_vim" 'send-keys M-k' 'select-pane -U'
bind -n M-l if-shell "$is_vim" 'send-keys M-l' 'select-pane -R'

# Also keep C-hjkl for vim-tmux-navigator compatibility
bind -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
bind -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
bind -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
bind -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'
bind C-l send-keys 'C-l'

# resize panes: Alt+Shift+H/J/K/L (3 cells per step)
bind -n M-H resize-pane -L 3
bind -n M-J resize-pane -D 3
bind -n M-K resize-pane -U 3
bind -n M-L resize-pane -R 3

# zoom pane
bind -n M-f resize-pane -Z

# swap panes
bind > swap-pane -D
bind < swap-pane -U
bind | swap-pane

# toggle pane layout (horizontal <-> vertical)
bind Space run-shell "~/.tmux/scripts/toggle_orientation.sh"

# ─── Markers ─────────────────────────────────────────────────────
# toggle unread marker on current window
bind -n M-b run-shell 'val=$(tmux show -wv @unread 2>/dev/null); if [ "$val" = "1" ]; then tmux set -wu @unread; else tmux set -w @unread 1; fi; tmux refresh-client -S'

# toggle watching marker on current window
bind -n M-w run-shell 'val=$(tmux show -wv @watching 2>/dev/null); if [ "$val" = "1" ]; then tmux set -wu @watching; else tmux set -w @watching 1; fi; tmux refresh-client -S'

# ─── Clipboard (WSL2) ───────────────────────────────────────────
bind -n C-S-v run -b "~/.tmux/scripts/paste_from_clipboard.sh"
bind -T copy-mode-vi C-S-v send-keys -X cancel \; run -b "~/.tmux/scripts/paste_from_clipboard.sh"
bind -n M-V run -b "~/.tmux/scripts/paste_from_clipboard.sh"
bind -T copy-mode-vi M-V send-keys -X cancel \; run -b "~/.tmux/scripts/paste_from_clipboard.sh"

# ─── Synchronize Panes ──────────────────────────────────────────
bind C-g if-shell '[[ $(tmux showw synchronize-panes | cut -d\  -f2) == "on" ]]' \
'setw synchronize-panes off; set -g pane-border-style fg=colour244' \
'setw synchronize-panes on; set -g pane-border-style fg=red'

# ─── Buffers ─────────────────────────────────────────────────────
bind b list-buffers
bind p paste-buffer
