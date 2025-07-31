-- Mini.nvim plugin highlights

local M = {}

function M.setup(hl, colors, conf)
  if not (conf.plugins.all or conf.plugins.mini) then return end
  
  -- mini.statusline
  hl("MiniStatuslineModeNormal", { fg = colors.bg, bg = colors.fg, bold = true })
  hl("MiniStatuslineModeInsert", { fg = colors.bg, bg = colors.yellow, bold = true })
  hl("MiniStatuslineModeVisual", { fg = colors.bg, bg = colors.red, bold = true })
  hl("MiniStatuslineModeReplace", { fg = colors.bg, bg = colors.red_dim, bold = true })
  hl("MiniStatuslineModeCommand", { fg = colors.bg, bg = colors.blue_light, bold = true })
  hl("MiniStatuslineModeOther", { fg = colors.bg, bg = colors.beige, bold = true })
  hl("MiniStatuslineDevinfo", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("MiniStatuslineFilename", { fg = colors.fg, bg = colors.bg_highlight })
  hl("MiniStatuslineFileinfo", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("MiniStatuslineInactive", { fg = colors.beige_dark, bg = colors.bg_alt })
  
  -- mini.tabline
  hl("MiniTablineCurrent", { fg = colors.fg, bg = colors.blue_light, bold = true })
  hl("MiniTablineVisible", { fg = colors.fg_dim, bg = colors.bg_highlight })
  hl("MiniTablineHidden", { fg = colors.beige_dark, bg = colors.bg_alt })
  hl("MiniTablineModifiedCurrent", { fg = colors.yellow, bg = colors.blue_light, bold = true })
  hl("MiniTablineModifiedVisible", { fg = colors.yellow_dim, bg = colors.bg_highlight })
  hl("MiniTablineModifiedHidden", { fg = colors.yellow_dim, bg = colors.bg_alt })
  hl("MiniTablineFill", { bg = conf.transparent and nil or colors.bg })
  hl("MiniTablineTabpagesection", { fg = colors.bg, bg = colors.red, bold = true })
  
  -- mini.indentscope
  hl("MiniIndentscopeSymbol", { fg = colors.beige_dark })
  hl("MiniIndentscopeSymbolOff", { fg = colors.red_dim })
  hl("MiniIndentscopePrefix", { nocombine = true })
  
  -- mini.cursorword
  hl("MiniCursorword", { underline = true })
  hl("MiniCursorwordCurrent", { underline = true })
  
  -- mini.surround
  hl("MiniSurround", { fg = colors.bg, bg = colors.yellow })
end

return M