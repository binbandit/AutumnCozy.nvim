-- TreeSitter highlights for AutumnCozy

local M = {}

function M.setup(hl, colors, conf)
  -- TreeSitter specific highlights
  hl("@comment", { link = "Comment" })
  hl("@string", { link = "String" })
  hl("@number", { link = "Number" })
  hl("@boolean", { link = "Boolean" })
  hl("@function", { link = "Function" })
  hl("@function.builtin", { fg = colors.fg, italic = true })
  hl("@parameter", { fg = colors.fg_dim, italic = true })
  hl("@keyword", { link = "Keyword" })
  hl("@operator", { link = "Operator" })
  hl("@type", { link = "Type" })
  hl("@property", vim.tbl_extend("force", { fg = colors.fg_dim }, conf.styles.properties or {}))
  hl("@field", { fg = colors.fg_dim })
  hl("@namespace", { fg = colors.blue_light })
  hl("@constructor", { fg = colors.yellow })
  hl("@variable", { link = "Variable" })
  hl("@constant", { link = "Constant" })
  hl("@punctuation.delimiter", { fg = colors.fg_dim })
  hl("@punctuation.bracket", { fg = colors.fg_dim })
  hl("@tag", { fg = colors.yellow })
  hl("@tag.attribute", { fg = colors.fg_dim })
  hl("@tag.delimiter", { fg = colors.beige_dark })
  hl("@text", { fg = colors.fg })
  hl("@text.uri", { fg = colors.blue_light, underline = true })
  hl("@text.reference", { fg = colors.yellow_dim })
  hl("@text.todo", { link = "Todo" })
  hl("@text.note", { fg = colors.beige, bold = true })
  hl("@text.warning", { fg = colors.yellow, bold = true })
  hl("@text.danger", { fg = colors.red, bold = true })
  
  -- TreeSitter Context
  hl("TreesitterContext", { bg = colors.bg_alt })
  hl("TreesitterContextLineNumber", { fg = colors.yellow_dim })
  hl("TreesitterContextBottom", { underline = true, sp = colors.beige_dark })
  
  -- TreeSitter Playground
  hl("TSPlaygroundFocus", { bg = colors.bg_highlight })
  hl("TSPlaygroundLang", { fg = colors.blue_light })
  hl("TSQueryLinterError", { fg = colors.red })
end

return M