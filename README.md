# telescope-yadm.nvim

Extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
that provides `yadm_files` that essentially does the same as the builtin 
`git_files`, but with [YADM](https://yadm.io/), duh!

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
require("telescope").load_extension("yadm")
```

LunarVim users, here's how to load a Telescope extension:

```lua
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension("yadm")
end
```

# Usage

```viml
:Telescope yadm
```
