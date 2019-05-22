```
wget https://raw.github.com/kmmndr/dotfiles/master/install_dot.sh --quiet -O - | bash
```

vim plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

tmux
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```
dot stash
dot reset --hard FETCH_HEAD
dot stash pop
```
