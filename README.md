# telescope-yadm.nvim

Extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
that provides:

- `yadm_files` which does the same as the builtin `git_files`, but 
with [YADM](https://yadm.io/), duh!
- `git_or_yadm_files`: First invokes the builtin `git_files`. If it fails 
(you're not currently in a git project dir) it falls back to `yadm_files`

# Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  "pschmitt/telescope-yadm.nvim",
  requires = "nvim-telescope/telescope.nvim"
}
```

# Setup

⚠️ You need to register this extension with:

```lua
require("telescope").load_extension("yadm_files")
require("telescope").load_extension("git_or_yadm_files")
```

LunarVim users, here's how to load a Telescope extension:

```lua
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension("yadm_files")
  tele.load_extension("git_or_yadm_files")
end
```

# Usage

```viml
:Telescope yadm_files
:Telescope git_or_yadm_files
```
