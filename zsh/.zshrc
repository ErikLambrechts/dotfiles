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
  _mode_indicator="%{$fg_bold[red]%}  ${${KEYMAP/vicmd/[% VI]%}/(main|viins)/%} %{$reset_color%}"
  echo $_mode_indicator
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info) $(bureau_git_prompt)'
RPS2=$RPS1

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

if [ -f ~/.aliases ]; then
    . ~/.aliases
else
	echo "aliases not loaded '~/.aliases' is missing"
fi

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

#
# Options
#

setopt autocd               # .. is shortcut for cd .. (etc)
# setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
setopt correct              # command auto-correction
setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
# setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
setopt printexitvalue       # for non-zero exit status
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
# setopt pushdsilent          # don't print dir stack after pushing/popping
setopt sharehistory         # share history across shells

# added by Miniconda3 4.3.14 installer
export PATH="/home/erik/miniconda3/bin:$PATH"
export PATH=$HOME/mosek/7/tools/platform/linux64x86/bin/mosek:$PATH


export GUROBI_HOME="/media/Data/Downloads/gurobi752/linux64"
# "/opt/gurobi752/linux64/"
export GRB_LICENSE_FILE="/media/Data/Licenses/Gurobi/gurobi.lic"
# "/home/erik/Licenses/Gurobi/gurobi.lic"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SCIPOPTDIR="/usr/"

export PATH=~/Software/micmac/bin:$PATH
