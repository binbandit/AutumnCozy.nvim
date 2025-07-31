-- Alpha dashboard highlights

local M = {}

function M.setup(hl, colors, conf)
  if not (conf.plugins.all or conf.plugins.alpha) then return end
  
  hl("AlphaHeader", { fg = colors.yellow })
  hl("AlphaHeaderLabel", { fg = colors.red, bold = true })
  hl("AlphaFooter", { fg = colors.beige_dark, italic = true })
  hl("AlphaShortcut", { fg = colors.blue_light })
  hl("AlphaButtons", { fg = colors.fg })
  hl("AlphaQuote", { fg = colors.fg_dim, italic = true })
end

return M