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

# antidote zsh
ln -s $(realpath antidote.zshrc) ~/.zshrc
ln -s $(realpath antidote.zsh_plugins.txt) ~/.zsh_plugins.txt
```
