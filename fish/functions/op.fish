function op --description "Open file with Windows default app"
    cmd.exe /c start "" (wslpath -w $argv[1]) 2>/dev/null
end
