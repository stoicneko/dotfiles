function nvim --wraps=nvim
    command nvim $argv
    commandline -f repaint
end
