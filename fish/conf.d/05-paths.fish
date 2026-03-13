if type -q fish_add_path
    fish_add_path -m "$HOME/.local/bin"
    fish_add_path -m "$HOME/bin"
else
    set -q PATH; or set PATH
    contains -- "$HOME/.local/bin" $PATH; or set -gx PATH "$HOME/.local/bin" $PATH
    contains -- "$HOME/bin" $PATH; or set -gx PATH "$HOME/bin" $PATH
end
