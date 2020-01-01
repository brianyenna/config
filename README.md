This repo contains my personal config files for various tools/utilities

# Installation Instructions
## vim
Refer to
[this](https://www.linode.com/docs/tools-reference/tools/introduction-to-vim-customization/)
for more information. 

Copy the vimrc and vimrc.plug files over to your user's home directory (i.e.
`~`) and renames the files `.vimrc` and `vimrc.plug` respectively.

Create the installation directories, download and install vim-plug from GitHub
by running the following command:
```bash
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

The `.vimrc.plug` file assumes the existence of a directory `~/.vim/plugged` where
the plugins will be stored, so this directory must be created and be given the
appropriate permissions/rights.
```bash
mkdir ~/.vim/plugins
chmod -R 0775 ~/.vim
```

Open vim and issue the `PlugInstall` command in command mode (i.e. type
`:PlugInstall`) to open the plug-in manager within vim and install all the
plug-ins lsited in the `~/.vimrc.plug` file
