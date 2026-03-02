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
alias cfish "nvim $HOME/.config/fish/config.fish"
alias sfish "source $HOME/.config/fish/config.fish"
alias cyazi "nvim $HOME/.config/yazi/keymap.toml"

# eza / exa
alias tree 'exa -T'
alias l 'eza -lh --icons=auto'
alias ls 'eza -1 --icons=auto'
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first'
alias ld 'eza -lhD --icons=auto'
alias lt 'eza --icons=auto --tree'

# Abbreviations — general
abbr :q exit
abbr b btop
abbr c clear

# Abbreviations — git
abbr gcl "git clone"
abbr gs "git status"
abbr ga "git add"
abbr gaa "git add --all"
abbr gc "git commit"
abbr gac "git commit -am"
abbr gps "git push"
abbr gpl "git pull"
abbr gsi "git submodule init"
abbr gsu "git submodule update --recursive --remote"
abbr lg lazygit

# Abbreviations — pacman / AUR
abbr un "$aurhelper -Rns"
abbr up "$aurhelper -Syu"
abbr pf "$aurhelper -Qs"
abbr ps "$aurhelper -Ss"
abbr pi "$aurhelper -S"
abbr pc "$aurhelper -Sc"
abbr po "$aurhelper -Qtdq | $aurhelper -Rns -"
