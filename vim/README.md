# My `vimrc` file
For the latest `vimrc` config file, I mainly followed the instructions provided
in https://github.com/jez/vim-as-an-ide

# Installation Instructions

## Install Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Add a symbolic link to this `.vimrc` file

```bash
# Assuming you've already `git clone`-ed this file
ln -s ~/config/vim/vimrc ~/.vimrc
```

## Install Vim Plugins using Vundle

```bash
vim +PluginInstall +qall
```
