#!/bin/zsh

autoload -U colors && colors
autoload -Uz compinit && compinit

autoload -U bashcompinit
bashcompinit

autoload -Uz vcs_info

autoload -z edit-command-line
zle -N edit-command-line

#-----------------#
# Auto-completion #
#-----------------#
zstyle :compinstall filename '/home/thomas/.zshrc'

# Display a message when no match
#zstyle ':completion:*:warnings' format 'No matches for: %d'

# Ignore completion functions for commands you don't have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# Use a cache for slow functions (_dpkg, _apt, ...)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Ignore filenames already on the command line
zstyle ':completion:*:rm:*' ignore-line yes

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# Completing process IDs with menu selection
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

#---------------------#
# VCS infos in prompt #
#---------------------#
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:git*' formats " (%s.%b) "
zstyle ':vcs_info:hg*' formats " (%s.%b) "

#--------------------#
# Options activation #
#--------------------#
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history

setopt complete_in_word
# move cursor to end of line when completing in the middle
setopt always_to_end
# spelling correction of commands
setopt correct
setopt hist_verify
setopt interactive_comments

setopt extendedglob
setopt autocd
setopt nobeep

setopt prompt_subst

#----------#
# VIM mode #
#----------#
bindkey -v
bindkey -M vicmd v edit-command-line
# backward search
bindkey "^R" history-incremental-search-backward

# Affiche le mode (normal ou insert) dans le prompt de droite
function zle-line-init zle-keymap-select
{
    RPS1="${${KEYMAP/vicmd/-N-}/(main|viins)/-I-}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#-------------#
# Useful vars #
#-------------#
export HISTFILE=~/.histfile
export HISTSIZE=5000
export SAVEHIST=5000

# display time for commands taking longer than this value
export REPORTTIME=10

export EDITOR=vim
export PAGER=less

if [ $(whoami) = "root" ]
then
    if [ $USER = "root" ]
    then COLOR="red"
    else COLOR="blue"
    fi
else COLOR="green"
fi

export PS1='%n@%m%{$fg[$COLOR]%}:%{$reset_color%}%~${vcs_info_msg_0_}%{$fg[$COLOR]%}%#%{$reset_color%} '
export PS2="%_> "

export PATH="${PATH}:${HOME}/.gem/ruby/1.9.1/bin"

export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline
export LESS_TERMCAP_ue=$'\E[0m' # end underline

# Ruby variables and optimisations
export RAILS_PORT=1936

#export RBENV_ROOT="${HOME}/.rbenv"
#if [ -d "${RBENV_ROOT}" ]; then
#  export PATH="${RBENV_ROOT}/bin:${PATH}"
#  eval "$(rbenv init -)"
#fi

export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

precmd() {
    [ -t 0 ] && print -Pn "\33]2;%(!.[ROOT] .)%m:%~ | ${COLUMNS}x${LINES} | %y\007"
    vcs_info
}
preexec() { }

#-------#
# Alias #
#-------#
alias vi='vim'
alias mv='mv -i'
alias tmux='tmux -2'
alias mv_p='rsync --progress --remove-source-files -h'
alias ls='ls --color=auto'
alias ll='ls -l'
alias windows='sudo grub-reboot 2;sudo reboot'
alias youtube='quvi --exec "mplayer %u"'
alias poweroff='sudo poweroff'
alias xephyr-dualscreen='Xephyr -ac -br -noreset -screen 800x600 -screen 800x600 :1& sleep 3; DISPLAY=:1; setxkbmap fr bepo'
alias xephyr-onescreen='Xephyr -ac -br -noreset -screen 800x600 :1& sleep 3; DISPLAY=:1; setxkbmap fr bepo'
alias reload="killall -u `id -nu` -s USR1 zsh"

alias -s pdf=zathura
alias -s ps=gv
alias -s dvi=xdvi
alias -s avi=mplayer
alias -s mkv=mplayer
alias -s mp4=mplayer
alias -s webm=mplayer
alias -s mp3=mplayer
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh

#-----------------#
# Other functions #
#-----------------#
function rpass() {
    cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12}
    echo
}
function utime() {
    date -d "1970-01-01 GMT $1 seconds";
}
function confirm() {
    echo -n "$1 [Yn]? "; read reply;
        case $reply in
            N*|n*) false ;;
            *) true ;;
        esac
}
function send_infocmp() {
    REMOTE=$1
    infocmp rxvt-unicode-256color | ssh $REMOTE "mkdir -p .terminfo && cat >/tmp/ti && tic /tmp/ti"
}

trap "source ~/.zshrc && rehash" USR1
