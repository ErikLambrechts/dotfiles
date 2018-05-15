
alias project="vi \$(cat project) +vs"
alias ccat='pygmentize -g'
alias rg="ranger"
alias weer="curl -4 http://wttr.in"
# alias matlab="matlab -nosplash"

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'

 ## a quick way to get out of current directory ##
alias ..='cd ..'

alias e=exit
# alias ee="kill $(jobs -p);exit"
alias c=clear

alias v=vim

alias n="nautilus ."
alias prjct="gnome-terminal -x zsh -c \"source ~/.zshrc; sh ~/project_tmux;\""
# alias gncpp="gnome-terminal -x zsh -c \"source ~/.zshrc; sh ~/cpp_tmux; \""
alias tk="tmux kill-session"

alias gits="git stash"
alias gitsl="git stash list"
alias gitsp="git stash pop"
alias gitc="git checkout"
alias gitcd="gitc develop"
alias gitcm="gitc master"
alias gitclean="git clean -d -f -x -n"

alias gn="gnome-terminal"
