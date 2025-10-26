function vf --description "Pick a file with fzf and edit it in Neovim"
    if not type -q fzf
        echo "vf: fzf is not installed" >&2
        return 1
    end

    set -l selection (fzf)
    test -n "$selection"; or return 1

    nvim "$selection"
end
