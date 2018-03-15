set fish_greeting ""

set -x PATH ~/.local/bin $PATH
set -x PATH ~/.local/lib/ry/current/bin $PATH

set -x GOPATH ~/work/go
set -x PATH $GOPATH/bin $PATH

alias be='bundle exec'
abbr --add be bundle exec
abbr --add bi bundle install
abbr --add bu bundle update
alias g='git'
alias t='tig'
alias G='gvim'
alias GG='gvim Gemfile'
alias dd_stats='killall dd -USR1'
alias ssh_no_key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'
alias view='vim -R'
alias tmuxd='tmux new-session -d'
abbr --add kdd 'kd +'

set -x EDITOR vim
set -x PAGER less

# https://github.com/thestinger/termite/issues/229
if [ $TERM = "xterm-termite" ]
  set TERM "xterm-256color"
end
