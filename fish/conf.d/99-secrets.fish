status is-interactive; or exit

set -gx GITHUB_PERSONAL_ACCESS_TOKEN (gh auth token)

# Source local secrets file (not tracked by git)
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end
