# Copy-mode (vi) customizations

# enter copy mode
bind -n M-v copy-mode

# selection
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi C-v send-keys -X rectangle-toggle

# navigation (QWERTY: h/j/k/l are already default in vi mode)
bind -T copy-mode-vi K send-keys -N 5 -X cursor-up
bind -T copy-mode-vi J send-keys -N 5 -X cursor-down
bind -T copy-mode-vi H send-keys -X start-of-line
bind -T copy-mode-vi L send-keys -X end-of-line
bind -T copy-mode-vi e send-keys -X next-word-end

# scrolling
unbind -T copy-mode-vi C-u
unbind -T copy-mode-vi C-d
bind -T copy-mode-vi C-u send-keys -N 5 -X scroll-up
bind -T copy-mode-vi C-d send-keys -N 5 -X scroll-down

# copy
bind -T copy-mode-vi Y send-keys -X copy-end-of-line
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "~/.tmux/scripts/copy_to_clipboard.sh"

# search
bind -T copy-mode-vi / command-prompt -i -p "(search down)" "send -X search-forward-incremental \"%%%\""
bind -T copy-mode-vi ? command-prompt -i -p "(search up)" "send -X search-backward-incremental \"%%%\""

# pane navigation from copy mode
bind -T copy-mode-vi 'C-h' select-pane -L
bind -T copy-mode-vi 'C-j' select-pane -D
bind -T copy-mode-vi 'C-k' select-pane -U
bind -T copy-mode-vi 'C-l' select-pane -R

# clipboard paste from copy mode
bind -T copy-mode C-S-v send-keys -X cancel \; run -b "~/.tmux/scripts/paste_from_clipboard.sh"
bind -T copy-mode M-V send-keys -X cancel \; run -b "~/.tmux/scripts/paste_from_clipboard.sh"
