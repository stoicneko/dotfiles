function upd --description "Git pull, add all, commit with 'update', and push"
    command git pull
    command git add --all
    command git commit -m update
    command git push
end
