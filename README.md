```
wget https://raw.github.com/kmmndr/dotfiles/master/install_dot.sh --quiet -O - | bash
```

vim minpac
```
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
vim +PackUpdate +qall
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
