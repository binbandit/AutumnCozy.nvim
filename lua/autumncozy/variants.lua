-- AutumnCozy theme variants

local util = require('autumncozy.util')

local M = {}

-- Apply muted variant transformations
function M.muted(colors)
  -- Mute vibrant colors for a more subdued look
  colors.yellow = util.darken(colors.yellow, 0.15)
  colors.yellow_dim = util.darken(colors.yellow_dim, 0.15)
  colors.yellow_bright = util.darken(colors.yellow_bright, 0.15)
  colors.red = util.darken(colors.red, 0.15)
  colors.red_dim = util.darken(colors.red_dim, 0.15)
  colors.red_dark = util.darken(colors.red_dark, 0.1)
  colors.beige = util.darken(colors.beige, 0.1)
  colors.blue_light = util.darken(colors.blue_light, 0.1)
  colors.fg = util.darken(colors.fg, 0.05)
  colors.fg_bright = colors.fg -- No longer brighter
  
  return colors
end

-- Apply light variant transformations
function M.light(colors)
  -- Create a light theme by swapping and adjusting colors
  local light_colors = {
    none = colors.none,
    -- Backgrounds become light
    bg = "#F6F3E7",           -- Was fg (Rapture's Light)
    bg_alt = "#E7D5C5",       -- Was beige
    bg_highlight = "#D0C0B0", -- Was fg_dim
    bg_float = "#F0EDE1",     -- New light float bg
    
    -- Foregrounds become dark
    fg = "#011C39",           -- Was bg (Naval Night)
    fg_dim = "#143C5D",       -- Was bg_alt
    fg_bright = "#0A2A50",    -- Was bg_highlight
    
    -- Adjust accent colors for light background
    yellow = util.darken(colors.yellow, 0.25),
    yellow_dim = util.darken(colors.yellow_dim, 0.25),
    yellow_bright = util.darken(colors.yellow, 0.1),
    
    red = util.darken(colors.red, 0.2),
    red_dim = util.darken(colors.red_dim, 0.2),
    red_dark = util.darken(colors.red, 0.3),
    
    blue_light = util.darken(colors.blue_light, 0.15),
    blue_dim = util.darken(colors.blue_light, 0.25),
    
    beige = util.darken(colors.beige, 0.2),
    beige_dark = util.darken(colors.beige_dark, 0.15),
  }
  
  -- Merge with original colors table
  for k, v in pairs(light_colors) do
    colors[k] = v
  end
  
  return colors
end

-- Apply variant based on config
function M.apply(colors, variant)
  if variant == "muted" then
    return M.muted(colors)
  elseif variant == "light" then
    vim.o.background = "light"
    return M.light(colors)
  else
    -- Default variant, no changes
    return colors
  end
end

return M