set fish_greeting ""

set -x PATH ~/bin $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.local/lib/ry/current/bin $PATH

set -x GOPATH ~/work/go
set -x PATH $GOPATH/bin $PATH

alias be='bundle exec'
abbr --add be bundle exec
abbr --add bi bundle install
abbr --add bu bundle update
abbr --add ku kubectl
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias tod="env GIT_DIR=$HOME/.dotfiles/ GIT_WORK_TREE=$HOME tig"
alias g='git'
alias t='tig'
alias G='gvim'
alias GG='gvim Gemfile'
alias dd_stats='killall dd -USR1'
alias ssh_unknown_host='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PubkeyAuthentication=no'
alias ssh_password_only='ssh -o PubkeyAuthentication=no'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'
alias view='vim -R'
alias tmuxd='tmux new-session -d'
alias be-rubocop='bundle exec rubocop'
alias td="cd (mktemp -d -p $HOME/tmp/)"
abbr --add kdd 'kd +'
abbr --add sas 'ssh-agent_start'
abbr --add sa 'ssh-add'

set -x EDITOR vim
set -x PAGER less

# https://github.com/thestinger/termite/issues/229
# if [ $TERM = "xterm-termite" ]
#   set TERM "xterm-256color"
# end

# fundle plugin 'tuvistavie/fish-ssh-agent'
# fundle init
