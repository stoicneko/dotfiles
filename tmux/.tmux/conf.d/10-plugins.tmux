# Plugin configuration (TPM)

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# -- Resurrect: session persistence
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-processes 'lazygit yazi'

# -- Continuum: auto-save every 5 minutes
set -g @continuum-save-interval '5'
set -g @continuum-restore 'off'

# Disable default TPM keybindings (use `prefix + I` to install manually)
# set -g @tpm-install 'M-F12'
# set -g @tpm-update 'M-F12'
# set -g @tpm-clean 'M-F12'

# Initialize TPM (keep at very bottom of all config)
run '~/.tmux/plugins/tpm/tpm'
