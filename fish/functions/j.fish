function j --description "Jump with zoxide when possible, fallback to cd"
    if test (count $argv) -eq 0
        z
        return
    end

    if test "$argv[1]" = -
        z $argv
        return
    end

    cd $argv 2>/dev/null || z $argv
end
