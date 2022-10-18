# `tmux` Config File

## Installation Instructions

TODO: Add more here

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
```

## Modes

Use `Prefix :` to enter command mode
Use `Prefix [` to enter copy mode (Use `Prefix ]` to paste buffer's contents)

TODO: Deal with copying --> vim keybindings? --> a solution that works for both MacOSX and Linux?

## Good Resources

1. https://thoughtbot.com/upcase/tmux

