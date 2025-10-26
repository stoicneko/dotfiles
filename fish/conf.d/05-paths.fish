if type -q fish_add_path
    fish_add_path -m "$HOME/.local/bin"
else
    set -q PATH; or set PATH
    contains -- "$HOME/.local/bin" $PATH; or set -gx PATH "$HOME/.local/bin" $PATH
end
