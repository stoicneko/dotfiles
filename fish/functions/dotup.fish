function dotup --description "Update nvim plugins and sync dotfiles to GitHub"
    set -l orig_dir (pwd)

    cd ~/dotfiles; or return 1

    echo "Syncing dotfiles..."
    command git pull --rebase --autostash; or begin
        cd $orig_dir
        return 1
    end

    echo "Updating Neovim plugins..."
    command nvim --headless "+Lazy! sync" +qa 2>/dev/null; or begin
        cd $orig_dir
        return 1
    end

    command git add --all

    if test -n "$(command git status --short)"
        command git commit -m "update"; or begin
            cd $orig_dir
            return 1
        end

        command git push; or begin
            cd $orig_dir
            return 1
        end
    else
        echo "No dotfiles changes to commit."
    end

    cd $orig_dir
end
