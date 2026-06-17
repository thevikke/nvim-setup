# This is my simple Neovim setup.

- Based on this [video series by Typecraft](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn).

## How to add new plugins?

1. Find plugin from GitHub.
2. Create new plugin x.lua-file.
3. Add 'return' with the lua table of the installation for lazy-package manager.
4. :w to save should show loading the changes.

## Other

- init.lua the main file that loads the plugins from /lua/plugins/x-plugin.lua.
- vim-options.lua also loaded from init.lua it contains all the necessary key mappings.
- Based [on this repo](https://github.com/cpow/neovim-for-newbs/blob/main/init.lua) and [this video](https://www.youtube.com/watch?v=4zyZ3sw_ulc).
