# Installation Instructions

1. Install `nvim` (version >= 0.6)
2. Git clone this repo (`$REPO_DIR`)
3. Download `vim-plug`

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Create the symbolic links below

```bash
# Create symbolic links
ln -s $REPO_DIR/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $REPO_DIR/nvim/init.vim ~/.config/nvim/init.vim
```

5. Start nvim and run `:PlugInstall`
