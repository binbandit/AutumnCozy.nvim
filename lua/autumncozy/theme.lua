-- AutumnCozy theme loader

local util = require('autumncozy.util')
local config = require('autumncozy.config')
local variants = require('autumncozy.variants')
local palette = require('autumncozy.palette')

local M = {}

-- Load and apply the theme
function M.load()
  -- Get configuration
  local conf = config.get()
  
  -- Get base colors
  local colors = palette.get_colors()
  
  -- Apply variant transformations
  colors = variants.apply(colors, conf.variant)
  
  -- Apply user color overrides
  conf.on_colors(colors)
  
  -- Clear existing highlights and reset syntax
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  if conf.variant ~= "light" then
    vim.o.background = "dark"
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "autumncozy"
  
  -- Helper function to set highlights
  local function hl(group, opts)
    opts = opts or {}
    -- Handle transparency
    if conf.transparent and opts.bg and (opts.bg == colors.bg or opts.bg == colors.bg_alt) then
      opts.bg = nil
    end
    vim.api.nvim_set_hl(0, group, opts)
  end
  
  -- Apply all highlights
  M.apply_highlights(hl, colors, conf)
  
  -- Apply user highlight overrides
  conf.on_highlights(hl, colors)
  
  -- Set terminal colors if enabled
  if conf.terminal_colors then
    M.set_terminal_colors(colors)
  end
  
  -- Cache compiled theme if enabled
  if conf.cache then
    M.cache_theme()
  end
end

-- Apply all theme highlights
function M.apply_highlights(hl, colors, conf)
  -- Core UI elements
  hl("Normal", { fg = colors.fg, bg = conf.transparent and nil or colors.bg })
  hl("NormalFloat", { fg = colors.fg, bg = colors.bg_float })
  hl("NormalNC", { fg = colors.fg_dim, bg = conf.transparent and nil or colors.bg })
  hl("FloatBorder", { fg = colors.beige, bg = colors.bg_float })
  hl("CursorLine", { bg = colors.bg_highlight })
  hl("CursorLineNr", { fg = colors.yellow, bg = colors.bg_highlight, bold = true })
  hl("CursorColumn", { bg = colors.bg_highlight })
  hl("LineNr", { fg = colors.beige_dark })
  hl("SignColumn", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
  hl("StatusLine", { fg = colors.fg, bg = colors.bg_alt, bold = true })
  hl("StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("WinBar", { fg = colors.fg, bg = colors.bg_alt })
  hl("WinBarNC", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("VertSplit", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
  hl("WinSeparator", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
  hl("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
  hl("PmenuSel", { fg = colors.bg, bg = colors.yellow })
  hl("PmenuSbar", { bg = colors.bg_highlight })
  hl("PmenuThumb", { bg = colors.beige })
  hl("TabLine", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("TabLineFill", { bg = conf.transparent and nil or colors.bg })
  hl("TabLineSel", { fg = colors.fg, bg = colors.blue_light, bold = true })
  hl("Title", { fg = colors.yellow_bright, bold = true })
  hl("NonText", { fg = colors.beige_dark })
  hl("SpecialKey", { fg = colors.beige_dark })
  hl("EndOfBuffer", { fg = colors.bg_alt })

  -- Syntax highlighting with style support
  hl("Comment", vim.tbl_extend("force", { fg = colors.beige_dark }, conf.styles.comments or {}))
  hl("String", vim.tbl_extend("force", { fg = colors.yellow }, conf.styles.strings or {}))
  hl("Character", { fg = colors.yellow_dim })
  hl("Number", vim.tbl_extend("force", { fg = colors.yellow_dim }, conf.styles.numbers or {}))
  hl("Float", vim.tbl_extend("force", { fg = colors.yellow_dim }, conf.styles.numbers or {}))
  hl("Boolean", vim.tbl_extend("force", { fg = colors.red }, conf.styles.booleans or {}))
  hl("Function", vim.tbl_extend("force", { fg = colors.fg }, conf.styles.functions or {}))
  hl("Identifier", { fg = colors.fg_dim })
  hl("Variable", vim.tbl_extend("force", { fg = colors.fg_dim }, conf.styles.variables or {}))
  hl("Constant", { fg = colors.yellow })
  hl("Keyword", vim.tbl_extend("force", { fg = colors.red }, conf.styles.keywords or {}))
  hl("Conditional", vim.tbl_extend("force", { fg = colors.red }, conf.styles.keywords or {}))
  hl("Repeat", vim.tbl_extend("force", { fg = colors.red }, conf.styles.keywords or {}))
  hl("Label", { fg = colors.red })
  hl("Operator", vim.tbl_extend("force", { fg = colors.red_dim }, conf.styles.operators or {}))
  hl("Exception", vim.tbl_extend("force", { fg = colors.red }, conf.styles.keywords or {}))
  hl("Include", { fg = colors.blue_light })
  hl("Define", { fg = colors.blue_light })
  hl("Macro", { fg = colors.blue_light })
  hl("PreProc", { fg = colors.blue_light })
  hl("Type", vim.tbl_extend("force", { fg = colors.blue_light }, conf.styles.types or {}))
  hl("StorageClass", vim.tbl_extend("force", { fg = colors.blue_light }, conf.styles.types or {}))
  hl("Structure", vim.tbl_extend("force", { fg = colors.blue_light }, conf.styles.types or {}))
  hl("Typedef", vim.tbl_extend("force", { fg = colors.blue_light }, conf.styles.types or {}))
  hl("Special", { fg = colors.yellow })
  hl("SpecialChar", { fg = colors.yellow_dim })
  hl("Tag", { fg = colors.yellow })
  hl("Delimiter", { fg = colors.fg_dim })
  hl("SpecialComment", { fg = colors.beige_dark, italic = true })
  hl("Debug", { fg = colors.red })
  hl("Underlined", { underline = true })
  hl("Ignore", { fg = colors.beige_dark })
  hl("Error", { fg = colors.red, bold = true, underline = true })
  hl("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
  hl("SpellBad", { undercurl = true, sp = colors.red })
  hl("SpellCap", { undercurl = true, sp = colors.yellow })
  hl("SpellRare", { undercurl = true, sp = colors.beige })
  hl("SpellLocal", { undercurl = true, sp = colors.blue_light })

  -- Load highlight modules
  require('autumncozy.highlights.treesitter').setup(hl, colors, conf)
  require('autumncozy.highlights.lsp').setup(hl, colors, conf)
  require('autumncozy.highlights.plugins').setup(hl, colors, conf)
  require('autumncozy.highlights.all_plugins').setup(hl, colors, conf)
end

-- Set terminal colors
function M.set_terminal_colors(colors)
  local terminal_colors = {
    [0] = colors.bg_alt,
    [1] = colors.red_dim,
    [2] = colors.yellow_dim,
    [3] = colors.yellow,
    [4] = colors.blue_light,
    [5] = colors.red,
    [6] = colors.beige,
    [7] = colors.fg_dim,
    [8] = colors.bg_highlight,
    [9] = colors.red,
    [10] = colors.yellow_dim,
    [11] = colors.yellow,
    [12] = colors.blue_light,
    [13] = colors.red_dim,
    [14] = colors.beige_dark,
    [15] = colors.fg,
  }

  for i, color in ipairs(terminal_colors) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

-- Cache compiled theme
function M.cache_theme()
  -- For now, disable caching to avoid issues
  -- TODO: Implement proper caching mechanism
  return
end

-- Load from cache if available
function M.load_from_cache()
  -- For now, disable cache loading to avoid issues
  -- TODO: Implement proper caching mechanism
  return false
end

return M