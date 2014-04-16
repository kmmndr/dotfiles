```
wget https://raw.github.com/kmmndr/dotfiles/master/install.sh
bash install.sh
```

Not yet included, vim bundle update, you'll have to do it manually
```
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```
