-- AutumnCozy color palette
-- Export colors for users who want to extend or customize the theme

local util = require('autumncozy.util')

local M = {}

-- Base colors from MindfulPalettes № 106 (Autumnal Cozy)
M.base = {
  none = "NONE",
  bg = "#011C39",          -- Main background (Naval Night)
  bg_alt = "#143C5D",      -- Alternate bg (Poseidon)
  bg_highlight = "#0A2A50",-- Subtle highlight bg
  fg = "#F6F3E7",          -- Main foreground (Rapture's Light)
  fg_dim = "#D0C0B0",      -- Dimmed fg for secondary elements
  beige = "#E7D5C5",       -- Neutral/warm (Silver Thistle Beige)
  beige_dark = "#C0A890",  -- Darker beige for comments/diffs
  yellow = "#FFBB55",      -- Highlights/energy (Honey Crusted Chicken)
  yellow_dim = "#E7A33E",  -- Softer yellow
  red = "#C44E4F",         -- Errors/warnings (Autumn Fire)
  red_dim = "#A03B3C",     -- Dimmed red
  blue_light = "#2A5E8A",  -- Types/keywords (derived Poseidon variant)
}

-- Additional derived colors
M.derived = {
  yellow_bright = util.lighten(M.base.yellow, 0.15),
  red_dark = util.darken(M.base.red, 0.2),
  bg_float = util.lighten(M.base.bg_alt, 0.05),
  fg_bright = util.lighten(M.base.fg, 0.1),
  blue_dim = util.darken(M.base.blue_light, 0.15),
}

-- Get all colors combined
function M.get_colors()
  local colors = {}
  for k, v in pairs(M.base) do
    colors[k] = v
  end
  for k, v in pairs(M.derived) do
    colors[k] = v
  end
  return colors
end

-- Utilities re-exported for convenience
M.lighten = util.lighten
M.darken = util.darken

return M