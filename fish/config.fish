# Fish 基本设置
set -g fish_greeting ""

# 环境变量
set -gx EDITOR nvim # 默认编辑器
set -gx LANG en_US.UTF-8 # 语言环境
set -gx XDG_CONFIG_HOME $HOME/.config # XDG 配置目录
set -gx XDG_DATA_HOME $HOME/.local/share # XDG 数据目录
set -gx XDG_CACHE_HOME $HOME/.cache # XDG 缓存目录
set -gx PATH ~/.local/bin $PATH # 用户本地二进制目录
set -U SXHKD_SHELL /usr/bin/bash # sxhkd 使用 bash（跨会话）

# 全局函数
function upd -d "Git pull, add all, commit with 'update', and push"
    git pull
    git add --all
    git commit -m update
    git push
end

# 交互式会话配置
if status is-interactive
    fish_vi_key_bindings # 启用 vi 模式按键绑定

    # 目录导航
    abbr jj "cd .."
    alias .. 'cd ..'
    alias .2 'cd ../..'
    alias .3 'cd ../../..'
    alias .4 'cd ../../../..'
    alias .5 'cd ../../../../..'
    # 编辑器和配置文件
    abbr vi nvim
    abbr nv nvim
    abbr v nvim
    abbr t tmux
    abbr fa fastfetch

    abbr cfish "nvim $HOME/.config/fish/config.fish"
    abbr sfish "source $HOME/.config/fish/config.fish"
    abbr cyazi "nvim $HOME/.config/yazi/keymap.toml"

    # alias ls exa
    # alias l "exa -l --color=auto"
    # alias ll 'eza -lha --icons=auto --sort=name --group-directories-first'
    # alias la "exa -alh --color=auto"
    alias tree "exa -T"
    alias vf 'nvim $(fzf)'

    alias l "eza -lh --icons=auto" # long list
    alias ls "eza -1 --icons=auto" # short list
    alias ll "eza -lha --icons=auto --sort=name --group-directories-first" # long list all
    alias ld "eza -lhD --icons=auto" # long list dirs
    alias lt "eza --icons=auto --tree" # list folder as tree
    # 终端操作
    abbr :q exit

    # Git 相关
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

    function gitlog -d "Git log with custom format"
        git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit $argv
    end

    # 外部工具初始化
    zoxide init fish | source
    starship init fish | source
end

# 自定义函数
function j -d "Jump to directory with zoxide or cd"
    if test (count $argv) -eq 0
        z
    else if test "$argv[1]" = -
        z $argv
    else
        cd $argv 2>/dev/null || z $argv
    end
end

function a -d "Run yazi and change to its last directory"
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file="$tmp"
    if set cwd (command cat "$tmp"); and test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# fish_vi_key_bindings
# set -g fish_greeting
#
# set -U SXHKD_SHELL /usr/bin/bash
# set -gx EDITOR nvim
# set -gx LANG en_US.UTF-8
# set -gx XDG_CONFIG_HOME $HOME/.config
# set -gx XDG_DATA_HOME $HOME/.local/share
# set -gx XDG_CACHE_HOME $HOME/.cache
#
# ### ---zoxide--- ###
# function j
#     if string match -q -- - $argv[1]
#         z $argv
#     else
#         cd $argv 2>/dev/null; or z $argv
#     end
# end
#
# ### ---yazi--- ###
# function a
#     set tmp (mktemp -t "yazi-cwd.XXXXX")
#     yazi --cwd-file="$tmp"
#     if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
#         cd -- "$cwd"
#     end
#     rm -f -- "$tmp"
# end
#
# if status is-interactive
#
#     alias .. "cd ./.."
#     alias ... "cd ./../.."
#     alias .... "cd ./../../.."
#
#     alias cfish "nvim ~/.config/fish/config.fish"
#     alias sfish "source ~/.config/fish/config.fish"
#     alias ls exa
#     alias l "exa -l --color=auto"
#     alias la "exa -alh --color=auto"
#     alias tree "exa -T"
#     alias fa fastfetch
#     alias jj "cd .."
#     alias vi nvim
#     alias nv nvim
#     alias v nvim
#     alias vf 'nvim $(fzf)'
#     alias jj 'cd ..'
#     alias ll clear
#     alias :q exit
#     # 使用 abbr 实现简单命令
# end
# # 全局作用域：适用于脚本和交互式会话的函数
# function upd -d "Git pull, add all, commit with 'update', and push"
#     git pull
#     git add --all
#     git commit -m "update"
#     git push
# end
#
# # 交互式会话专用的配置
# if status is-interactive
#     # 简单命令用 abbr
#     abbr gcl "git clone"
#     abbr gs "git status"
#     abbr ga "git add"
#     abbr gaa "git add --all"
#     abbr gc "git commit"
#     abbr gac "git commit -am"
#     abbr gps "git push"
#     abbr gpl "git pull"
#     abbr gsi "git submodule init"
#     abbr gsu "git submodule update --recursive --remote"
#     abbr lg "lazygit"
#
#     # 复杂命令用 function（仅交互式使用）
#     function gitlog -d "Git log with custom format"
#         git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit $argv
#     end
# end
#
#
# ### ---export--- ###
# export PATH="~/.local/bin:$PATH"
#
# zoxide init fish | source
# starship init fish | source
#
