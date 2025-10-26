function gitlog --description "Git log with colored, concise graph view"
    command git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit $argv
end
