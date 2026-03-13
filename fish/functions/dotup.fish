function dotup --description "Update nvim plugins and sync dotfiles to GitHub"
    set -l orig_dir (pwd)

    cd ~/dotfiles; or return 1

    echo "Updating Neovim plugins..."
    command nvim --headless "+Lazy! sync" +qa 2>/dev/null

    echo "Syncing dotfiles..."
    command git pull --rebase
    command git add --all
    command git commit -m "update"
    command git push

    cd $orig_dir
end
