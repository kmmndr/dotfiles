#!/bin/zsh

autoload -U colors && colors
autoload -Uz compinit && compinit

autoload -U bashcompinit
bashcompinit

autoload -Uz vcs_info

autoload -z edit-command-line
zle -N edit-command-line

# gentoo prompt
#autoload -Uz promptinit && promptinit && prompt gentoo

#-----------------#
# Auto-completion #
#-----------------#
zstyle :compinstall filename ~/.zshrc

# Display a message when no match
#zstyle ':completion:*:warnings' format 'No matches for: %d'

# Enable cache for completition
zstyle ':completition::complete:*' use-cache 1

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
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# key bindings

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-finish () {
      echoti rmkx
  }

  function zle-line-init zle-keymap-select
  {
      # Affiche le mode (normal ou insert) dans le prompt de droite
      RPS1="${${KEYMAP/vicmd/-N-}/(main|viins)/-I-}"
      RPS2=$RPS1
      zle reset-prompt

      # zle-line-init
      # Finally, make sure the terminal is in application mode, when zle is
      # active. Only then are the values from $terminfo valid.
      echoti smkx
  }
  zle -N zle-line-init
  zle -N zle-keymap-select
  zle -N zle-line-finish
fi


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

# gentoo user promt : %B%F{green}%n@%m%k %B%F{blue}%1~ %# %b%f%k
# gentoo root promt :      %B%F{red}%m%k %B%F{blue}%1~ %# %b%f%k
#
#
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

# chruby
CHRUBY_LOADER=/usr/local/share/chruby/chruby.sh
CHRUBY_AUTO=/usr/local/share/chruby/auto.sh
# checking for already loaded chruby
command -v chruby > /dev/null
CHRUBY_LOADED=$?
if [ -f $CHRUBY_LOADER -a $CHRUBY_LOADED != 0 ]; then
  source $CHRUBY_LOADER
  if [ -f $CHRUBY_AUTO ]; then
    source $CHRUBY_AUTO
  fi
fi

export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

case $TERM in
  xterm*|rxvt-unicode*)
    precmd () {
      print -Pn "\33]2;%(!.[ROOT] .)%m:%~ | ${COLUMNS}x${LINES} | %y\007"
      vcs_info
    }
    preexec() { }
    ;;
esac

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
trap "source ~/.zshrc && rehash" USR1
alias be='bundle exec'
alias rake='noglob rake'
alias g='git'
alias G='gvim'
alias GG='gvim Gemfile'
alias s='tmux attach -d'
alias f='fetchmail'
alias m='mutt'

alias -s pdf=qpdfview
alias -s ps=okular
alias -s dvi=okular
alias -s avi=mplayer
alias -s mkv=mplayer
alias -s mp4=mplayer
alias -s webm=mplayer
alias -s mp3=mplayer
alias -s png=gwenview
alias -s jpg=gwenview
alias -s gif=gwenview

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

#-----------#
# $home/bin #
#-----------#

if [ -d $HOME/bin/ ]; then
  export PATH="$PATH:$HOME/bin"
fi

#-----------#
# SSH agent #
#-----------#

SSH_ENV="$HOME/.ssh/environment"
SSH_AGENT=/usr/bin/ssh-agent
SSH_ADD=/usr/bin/ssh-add
function ssh_env_load {
  if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
  fi
}

function ssh-agent_start {
  ko=1
  ssh_env_load
  if [[ -n "${SSH_AGENT_PID}" ]]; then
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      # not running properly
      ko=0;
    }
  else
    # not running
    ko=0;
  fi

  if [ $ko -eq 0 ]; then
    echo "Initialising new SSH agent..."
    $SSH_AGENT | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    ssh_env_load
    $SSH_ADD;
  else
    echo "allready started"
  fi
}

function ssh-agent_stop() {
  ssh_env_load
  if [[ -n "${SSH_AGENT_PID}" ]]; then
    $SSH_ADD -D
    $SSH_AGENT -k > /dev/null 2>&1
    unset SSH_AGENT_PID
    unset SSH_AUTH_SOCK
    echo '' > "${SSH_ENV}"
  else
    echo "not yet started"
  fi
}

# Source SSH settings, if applicable
ssh_env_load

#-----------------#
# Curl gzip check #
#-----------------#

function curl_gzipchk() {
  curl -I -H 'Accept-Encoding: gzip,deflate' "$@" | grep --color 'Content-Encoding:';
}
