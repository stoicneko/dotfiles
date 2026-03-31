# All shared Fish configuration now lives in `conf.d/*.fish` and `functions/*`.
# Keep this file for per-host overrides or tweaks that must run after everything
# else has been initialized.

# Example: automatically attach to tmux on interactive shells.
# if status is-interactive; and not set -q TMUX
#     tmux new-session -As main
# end
# Use `set -gx GITHUB_PERSONAL_ACCESS_TOKEN <token>` in a file outside this repo,
# e.g. ~/.config/fish/conf.d/99-secrets.fish (not tracked by git).
