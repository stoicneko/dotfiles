function a --description "Open yazi and cd into the last visited directory"
    if not type -q yazi
        echo "a: yazi is not installed" >&2
        return 1
    end

    set -l tmp (command mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file "$tmp"

    if set -l cwd (command cat "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- "$cwd"
    end

    rm -f -- "$tmp"
end
