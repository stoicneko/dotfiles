status is-interactive; or exit

# Navigation
alias jj 'cd ..'
alias .. 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# Editors & tools
alias vi nvim
alias v nvim
alias t tmux
alias fa fastfetch
alias nv 'neovide.exe'

# Config shortcuts
alias cfish "nvim $HOME/.config/fish/conf.d"
function sfish -d "Reload fish conf.d"
    for f in $HOME/.config/fish/conf.d/*.fish
        source $f
    end
end
alias cyazi "nvim $HOME/.config/yazi/keymap.toml"

# eza / exa
alias tree 'exa -T'
alias l 'eza -lh --icons=auto'
alias ls 'eza --icons=auto'
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first'
alias ld 'eza -lhD --icons=auto'
alias lt 'eza --icons=auto --tree'
