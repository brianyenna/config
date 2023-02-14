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
- Any other files/sub-scripts required by a top-level script is to be local in a directory named `_<NAME_OF_SCRIPT>` in the root `craq` dir

## TODOs

TODO: Figure out a way to deal with the directory configuration --> a config file?
TODO: Add instructions on how to set up everything --> provide a set-up script? 
      - Must be able to deal with venv installation
      - Check for Python version --> must be > 3.9
TODO: Provide a bootstrap script that does the following:
      - create the top-level script (together with short desc)
      - create the script-specific folder
TODO: Create a helper script that will chmod u+x all the newly-created scripts. Do so recursively?
TODO: Document the file naming conventions and the separation of the various scripts into their directories
TODO: Be able to disable certain scripts --> put this in the config file?
TODO: Provide a way to configure env variables? --> programmatically do this and provide a rich TUI
TODO: Make a utils folder
      - Contains bash scripts (e.g. to log success, error, warning msgs etc.)
      - Contains other useful scripts (e.g. Python input to change env vars)
