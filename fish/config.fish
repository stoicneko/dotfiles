fish_vi_key_bindings
set -g fish_greeting

set -U SXHKD_SHELL /usr/bin/bash
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx XDG_CONFIG_HOME "~/.config/"

### ---zoxide--- ###
function j
    if string match -q -- - $argv[1]
        z $argv
    else
        cd $argv 2>/dev/null; or z $argv
    end
end

### ---yazi--- ###
function a
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive

    alias .. "cd ./.."
    alias ... "cd ./../.."
    alias .... "cd ./../../.."

    alias cfish "nvim ~/.config/fish/config.fish"
    alias sfish "source ~/.config/fish/config.fish"
    alias ls exa
    alias l "exa -l --color=auto"
    alias la "exa -alh --color=auto"
    alias tree "exa -T"
    alias fa fastfetch
    alias jj "cd .."
    alias vi nvim
    alias nv nvim
    alias v nvim
    alias vf 'nvim $(fzf)'
    alias jj 'cd ..'
    alias ll clear
    alias :q exit
end

### ---export--- ###
export PATH="~/.local/bin:$PATH"

zoxide init fish | source
starship init fish | source
