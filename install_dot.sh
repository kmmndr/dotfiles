#!/bin/bash
set -eu

DOTFILE_REPOSITORY='https://github.com/kmmndr/dotfiles.git'
DOT_FOLDER="$HOME/.dotfiles"

if [ ! -d "$DOT_FOLDER" ]; then
  git clone --bare $DOTFILE_REPOSITORY "$DOT_FOLDER"
fi

mkdir -p "$DOT_FOLDER/info"
echo '[^.]*' > "$DOT_FOLDER/info/exclude"

cd "$DOT_FOLDER"
git config --local status.showUntrackedFiles no

cat <<'EOF'
Done.

Now you can add aliases:
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias tod="env GIT_DIR=$HOME/.dotfiles/ GIT_WORK_TREE=$HOME tig"
EOF
