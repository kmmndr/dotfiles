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
alias s='tmux attach -d'
alias dd_stats='killall dd -USR1'
alias ssh_no_key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'
alias view='vim -R'
alias tmuxd='tmux new-session -d'

set -x EDITOR vim
set -x PAGER less
