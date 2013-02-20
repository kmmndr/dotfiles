curl https://raw.github.com/kmmndr/dotfiles/master/bin/rbenv-installer | bash

```
https://github.com/kmmndr/dotfiles/raw/master/vim/vimrc
ln vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```
