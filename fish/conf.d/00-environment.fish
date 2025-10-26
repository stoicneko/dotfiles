# Basic environment defaults shared by every shell.
set -g fish_greeting ""

set -q EDITOR; or set -gx EDITOR nvim
set -q LANG; or set -gx LANG en_US.UTF-8
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx aurhelper paru
