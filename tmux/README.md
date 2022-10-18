# `tmux` Config File

## Installation Instructions

1. Install `tpm` (`tmux` Plugin Manager)

2. Install `Nord` theme file

As noted [here](https://www.nordtheme.com/docs/ports/tmux/installation), `tmux`
must be used with a Nord terminal emulator theme in order to work properly.

In the case of iTerm2, a customised Nord theme file is included in this repo.

3. Install plugins

Open `tmux` and enter `Prefix-I` (note: the capital I) to install the plugins

## Some Interesting Commands

For each of the following commands, consult the `tmux` man pages to see
the exact flags that are necessary to achieve the desired behaviour.

```bash
# Allows you to break your current pane into a new window
# The keyboard shortcut for this is `Prefix-!`
tmux break-pane

# Allows you to join your current pane into another window
tmux join-pane

# List all buffers
tmux list-buffers

# Paste from a particular buffer
tmux choose-buffer

# Save the contents of the pane
tmux capture-pane
tmux pipe-pane

# Target a particular session/window/pane and send commands
tmux send-keys -t <SESSION>:<WINDOW>.<PANE> 'cd ~/somewhere' C-m
```

## Modes

Use `Prefix :` to enter command mode
Use `Prefix [` to enter copy mode (Use `Prefix ]` to paste buffer's contents)


## Good Resources

1. https://thoughtbot.com/upcase/tmux
2. tmux2: Productive Mouse-Free Development (book) - the chapter summaries are particularly useful

