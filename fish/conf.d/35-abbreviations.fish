status is-interactive; or exit

# General
abbr :q exit
abbr b btop
abbr c clear

# Git
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

# Pacman / AUR
abbr un "$aurhelper -Rns"
abbr up "$aurhelper -Syu"
abbr pf "$aurhelper -Qs"
abbr ps "$aurhelper -Ss"
abbr pi "$aurhelper -S"
abbr pc "$aurhelper -Sc"
abbr po "$aurhelper -Qtdq | $aurhelper -Rns -"

# Claude
abbr cl "claude --dangerously-skip-permissions"
