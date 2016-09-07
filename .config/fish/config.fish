set fish_greeting ""

set -x PATH ~/.local/bin $PATH
set -x PATH ~/.local/lib/ry/current/bin $PATH

alias be='bundle exec'
alias g='git'
alias t='tig'
alias G='gvim'
alias GG='gvim Gemfile'
alias s='tmux attach -d'
alias dd_stats='killall dd -USR1'
alias ssh_no_key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

set -x EDITOR vim
set -x PAGER less
