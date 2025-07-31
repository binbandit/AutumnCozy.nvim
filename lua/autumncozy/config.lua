-- AutumnCozy configuration module

local M = {}

-- Default configuration
M.defaults = {
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
  
  -- Performance options
  cache = false,  -- Enable caching (disabled by default until properly implemented)
  
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
    -- Add more as needed
  },
}

-- Current configuration
M.options = {}

-- Setup configuration
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

-- Get configuration
function M.get()
  return M.options
end

-- Get a specific option
function M.get_option(key)
  return M.options[key]
end

-- Initialize with defaults
M.setup()

return M