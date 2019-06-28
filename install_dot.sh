#!/bin/bash
set -eu

DOTFILE_REPOSITORY='https://github.com/kmmndr/dotfiles.git'
DOT_FOLDER="$HOME/.dotfiles"

if [ ! -d "$DOT_FOLDER" ]; then
  git clone --bare $DOTFILE_REPOSITORY "$DOT_FOLDER"
fi

mkdir -p "$DOT_FOLDER/info"
cat > "$DOT_FOLDER/info/exclude" <<EOF
# Ignore everything
/*
# Allow dot files
!/\.*
# Allow dot directories
!/\.*/
# Except cache
.cache
EOF

#cd "$DOT_FOLDER"
#git config --local status.showUntrackedFiles no

cat <<'EOFF'
Done.

Now you can add aliases:
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias tod="env GIT_DIR=$HOME/.dotfiles/ GIT_WORK_TREE=$HOME tig"

Then, to enable push (on github for example):
dot remote add github git@github.com:kmmndr/dotfiles.git

To exclude more stuff:
cat > ~/.gitignore <<EOF
/.bundle
/.cargo
/.icedove
/.icons
/.local
/.mozilla
/.npm
/.nuget
/.wine
/.wine64
EOF
EOFF
