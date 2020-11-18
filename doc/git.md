# Git tips and tricks

## Delete merged local branches
`$ git branch --merged | egrep -v "(^\*|master|mediaserver)" | xargs git branch -d`
