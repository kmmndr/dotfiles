#!/bin/bash

# change these parameters to your needs :-)
DOTFILE_REPOSITORY='https://github.com/kmmndr/dotfiles.git'
HOME_FOLDER="$HOME" # assuming you're using your own $HOME directory
DOT_FOLDER="$HOME_FOLDER/.dotfiles"
KEEP=0

function check_mkdir() {
  if [ ! -d $1 ]; then
    echo "creating directory '$1'"
    mkdir -p $1
  fi
}

# creating or upgrading dot folder
if [ ! -d "$DOT_FOLDER" ]; then
  echo "Initialize folder"
  git clone $DOTFILE_REPOSITORY "$DOT_FOLDER"
else
  echo "Updating folder"
  pushd $DOT_FOLDER > /dev/null
    git stash
    git pull origin master
    git stash pop
  popd > /dev/null
fi

# upgrading dot files
pushd "$DOT_FOLDER" > /dev/null
  versionned_files=`git ls-files '.*'`

  for file in $versionned_files
  do
    file_dir=`dirname $file`
    home_file=$HOME_FOLDER/$file
    home_file_dir=$HOME_FOLDER/$file_dir
    DIFF=$(diff $file $home_file 2>&1)
    if [ "$DIFF" != "" ]; then
      echo -e "\nFile $file differ"
      echo "$DIFF"
      if [ "$yes_for_all" == 'true' ]; then
        echo "assuming 'yes' for all"
        answer=y
      else
        read -p "upgrade '$home_file' ? [Dynaq] " answer
        answer=${answer:-d}
      fi

      case "$answer" in
        d) # diff
          check_mkdir $home_file_dir
          vimdiff $file $home_file
          ;;
        a|y) # overwrite
          if [ $answer == 'a' ]; then
            echo "yes for all [Enter to continue / Ctrl+C to abort]"; read
            yes_for_all=true
          fi
          check_mkdir $home_file_dir
          cp $file $home_file
          ;;
        n) # skip
          echo "skipping '$file'..."
          ;;
        q|*) # quit
          echo "quit."
          exit
          ;;
      esac


    fi
  done
popd > /dev/null

if [ $KEEP -ne 1 ]; then
  echo "removing $DOT_FOLDER"
  rm -rf $DOT_FOLDER
fi
