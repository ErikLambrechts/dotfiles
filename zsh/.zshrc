# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/erik/.oh-my-zsh
  #
# want your terminal to support 256 color schemes? I do ...
export TERM="screen-256color"
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="bureau"
# ZSH_THEME="sunrise"
ZSH_THEME="erik"

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    #perl
    ruby
    virtualenv
    #nvm
    #aws
    #go
    #elixir
    git
    #hg
    cmd_exec_time
  )

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-256color tmux vi-mode fzf zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  # echo "%{$fg_bold[white]%}${${KEYMAP/vicmd/[% VI]%}/(main|viins)/}%{$reset_color%}"
  # echo "${${KEYMAP/vicmd/%fg_bold[green]%}[% NORMAL]%}/(main|viins)/}"
  _mode_indicator="%{$fg_bold[red]%}  ${${KEYMAP/vicmd/[% VI]%}/(main|viins)/%} %{$reset_color%}"
  echo $_mode_indicator
  # echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info) $(bureau_git_prompt)'
RPS2=$RPS1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# Base16 Shell
# if status --is-interactive
eval sh $HOME/.config/base16-shell/scripts/base16-bright.sh
# end


bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

export EDITOR=vi
export VISUAL=vi

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

HIST_IGNORE_SPACE=" "
setopt histignoredups

# added by Miniconda3 4.3.14 installer
export PATH="/home/erik/miniconda3/bin:$PATH"
export PATH=$HOME/mosek/7/tools/platform/linux64x86/bin/mosek:$PATH

export GUROBI_HOME="/opt/gurobi752/linux64/"
export GRB_LICENSE_FILE="/home/erik/Licenses/Gurobi/gurobi.lic"

alias rg="ranger"
alias weer="curl -4 http://wttr.in"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias project="vi \$(cat project) +vs"
alias ccat='pygmentize -g'

export SCIPOPTDIR="/usr/"

export PATH=~/Software/micmac/bin:$PATH
