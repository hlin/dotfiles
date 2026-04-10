dotfiles
========

Backup configurations of:

- git
- iTerm2
- squirrel
- vim/neovim
- zsh

```
git clone https://github.com/hlin/dotfiles.git && cd dotfiles

ln -s $(realpath .vimrc) ~/
ln -s $(realpath .zshrc) ~/
ln -s $(realpath .gitconfig) ~/
ln -s $(realpath .gitignore) ~/
ln -s $(realpath nvim) ~/.config
```
