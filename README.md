# 🍂 AutumnCozy.nvim

A warm, cozy autumn-inspired colorscheme for Neovim with comprehensive plugin support and customization options.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Neovim](https://img.shields.io/badge/Neovim-0.8+-green.svg)

## 🎨 Color Palette

Based on MindfulPalettes № 106 (Autumnal Cozy):
- **Rapture's Light** (#F6F3E7) - Light foreground/base
- **Naval Night** (#011C39) - Dark background
- **Poseidon** (#143C5D) - Mid blue
- **Silver Thistle Beige** (#E7D5C5) - Beige/neutral
- **Honey Crusted Chicken** (#FFBB55) - Yellow/energy
- **Autumn Fire** (#C44E4F) - Red/warmth

## ✨ Features

- 🎯 **Three variants**: Default, Muted, and Light
- 🪟 **Transparency support**
- 🎨 **Customizable syntax styles**
- 🔌 **90+ plugin integrations**
- ⚡ **Performance optimized with caching**
- 🛠️ **Extensible with callbacks**

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "brayden/AutumnCozy.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("autumncozy").setup({
      -- your configuration
    })
    vim.cmd("colorscheme autumncozy")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "brayden/AutumnCozy.nvim",
  config = function()
    require("autumncozy").setup({
      -- your configuration
    })
    vim.cmd("colorscheme autumncozy")
  end
}
```

## ⚙️ Configuration

### Default Configuration

```lua
require("autumncozy").setup({
  variant = "default", -- Options: "default", "muted", "light"
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    variables = {},
    types = {},
    strings = {},
    numbers = {},
    booleans = {},
    properties = {},
    operators = {},
  },
  -- Callbacks for customization
  on_colors = function(colors) end,      -- Modify colors before use
  on_highlights = function(hl, colors) end, -- Modify highlights after setup
  
  -- Performance
  cache = true,  -- Enable caching for faster load times
  
  -- Plugin-specific settings
  plugins = {
    all = true, -- Enable all plugin integrations by default
    -- Individual plugin toggles (when all = false)
    telescope = true,
    nvim_tree = true,
    neo_tree = true,
    cmp = true,
    lualine = true,
    bufferline = true,
    gitsigns = true,
    treesitter = true,
    lsp = true,
    diagnostic = true,
    notify = true,
    mini = true,
    which_key = true,
    dashboard = true,
    alpha = true,
  },
})
```

### Variants

#### Muted Variant
A more subdued version with less vibrant colors for reduced eye strain:

```lua
require("autumncozy").setup({
  variant = "muted",
})
```

#### Light Variant
A light theme that inverts the color scheme:

```lua
require("autumncozy").setup({
  variant = "light",
})
```

### Transparency

Enable transparent backgrounds:

```lua
require("autumncozy").setup({
  transparent = true,
})
```

### Custom Styles

Customize syntax element styles:

```lua
require("autumncozy").setup({
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { italic = true },
    strings = { italic = false },
    variables = { bold = true },
  }
})
```

### Color Customization

Modify colors before they're applied:

```lua
require("autumncozy").setup({
  on_colors = function(colors)
    colors.yellow = "#FFD700"  -- Make yellow more golden
    colors.bg = "#000000"      -- Pure black background
  end,
})
```

### Highlight Customization

Override specific highlight groups:

```lua
require("autumncozy").setup({
  on_highlights = function(hl, colors)
    hl("Normal", { fg = colors.fg, bg = "#000000" })
    hl("Comment", { fg = colors.yellow, italic = false })
  end,
})
```

## 🔌 Supported Plugins

AutumnCozy supports 90+ popular Neovim plugins out of the box:

### Core
- TreeSitter
- Native LSP
- Diagnostics

### UI
- Telescope
- NvimTree / Neo-tree
- WhichKey
- Lualine / Feline
- Bufferline / Barbar
- Noice
- Notify
- Alpha / Dashboard

### Editor
- nvim-cmp
- LuaSnip
- Indent Blankline
- Rainbow Delimiters
- Todo Comments
- Illuminate
- Hop / Flash

### Git
- GitSigns
- Neogit
- Diffview

### Development
- nvim-dap
- Neotest
- Trouble
- Mason
- Overseer
- Aerial / Outline

### And many more!

## 🚀 Advanced Usage

### Access Colors

Get the color palette for use in your own configurations:

```lua
local colors = require("autumncozy").get_colors()
-- Use colors.fg, colors.bg, colors.yellow, etc.
```

### Extend Colors

Use the built-in utilities to create color variations:

```lua
local palette = require("autumncozy.palette")
local my_color = palette.lighten("#FFBB55", 0.2)
local darker = palette.darken(colors.red, 0.15)
```

### Force Reload

Bypass the cache and reload the theme:

```lua
require("autumncozy").reload()
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Color palette inspired by MindfulPalettes № 106 (Autumnal Cozy)
- Built with love for the Neovim community