# Using `nvim`

## Installation Instructions

1. Install `nvim` (version >= 0.6)
2. Git clone this repo
  - Let the location of the repo be `$REPO_DIR`
3. Download `vim-plug` by running the command below

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Create the symbolic links below

```bash
# Create config directory for nvim (this is where nvim searches for `init.vim`)
mkdir ~/.config/nvim

# Create symbolic links
ln -s $REPO_DIR/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $REPO_DIR/nvim/init.vim ~/.config/nvim/init.vim
```

5. Start nvim and run `:PlugInstall`
  - If you ever delete a plugin from the `init.vim` file, be sure to run `:PlugClean` as well

## Setting up `devicons`

In order for the devicons to show up in NERDTree, you must have a NerdFont installed.

Helpful resources:
- [NerdFonts website](https://www.nerdfonts.com/)
- [Previously encountered issue](https://github.com/ryanoasis/vim-devicons/issues/198#issuecomment-338769056)

## Setting up `telescope`

After running `:PlugInstall`, `telescope` already works out of the box. But to speed things up, `telescope` can use `fzf` as well. Hence, it is preferable to install `fzf`

See [this](https://github.com/junegunn/fzf#installation) for installation instructions. It's easiest to just git clone and run the installation script: 

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

For the `grep` functionality to work, you also have to install `ripgrep`

## Setting up `CoC`

1. Head to `~/.local/share/nvim/plugged/coc.nvim` and run `yarn install`
2. Install language-specific CoC plugins with `CocInstall <coc-plugin>`

## Setting up C++ IDE via `CoC`

Follow the instructions in:
- https://codevion.github.io/#!vim/coc.md
- https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/

