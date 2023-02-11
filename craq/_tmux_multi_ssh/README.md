# Craquelure

This project was inspired by `fzf-speed`

Just a random word I chanced upon and liked.

> Craquelure: a network of fine cracks in the paint or varnish of a painting

## Documentation

`craq.sh`
- This is the entry point to everything.
- This looks through the scripts found in `top_level_scripts` and uses fzf to display and select a script

`top_level_scripts`
- This is where the entry point to each script is found.
- Naming convention for each top-level script:
    - Name must be preceded with an underscore
    - This is the original naming convention used by fzf-speed
    - `_<NAME_OF_SCRIPT>,---,<SHORT_DESCRIPTION_SEPARATED_BY_PERIODS>`
