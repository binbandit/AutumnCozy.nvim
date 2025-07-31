local util = {}

-- Clamp a value between min and max
local function clamp(val, min, max)
  return math.min(math.max(val, min), max)
end

-- Convert hex to RGB
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16) / 255,
    g = tonumber(hex:sub(3, 4), 16) / 255,
    b = tonumber(hex:sub(5, 6), 16) / 255,
  }
end

-- Convert RGB to hex
local function rgb_to_hex(rgb)
  local function to_hex(val)
    return string.format("%02x", math.floor(clamp(val, 0, 1) * 255 + 0.5))
  end
  return "#" .. to_hex(rgb.r) .. to_hex(rgb.g) .. to_hex(rgb.b)
end

-- Convert RGB to HSL
local function rgb_to_hsl(rgb)
  local r, g, b = rgb.r, rgb.g, rgb.b
  local max = math.max(r, g, b)
  local min = math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max ~= min then
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)
    
    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    else
      h = (r - g) / d + 4
    end
    
    h = h / 6
  end

  return { h = h, s = s, l = l }
end

-- Convert HSL to RGB
local function hsl_to_rgb(hsl)
  local h, s, l = hsl.h, hsl.s, hsl.l
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l
  else
    local function hue_to_rgb(p, q, t)
      if t < 0 then t = t + 1 end
      if t > 1 then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
    end

    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue_to_rgb(p, q, h + 1/3)
    g = hue_to_rgb(p, q, h)
    b = hue_to_rgb(p, q, h - 1/3)
  end

  return { r = r, g = g, b = b }
end

-- Lighten a color by amount (0-1)
function util.lighten(color, amount)
  amount = amount or 0.1
  local rgb = hex_to_rgb(color)
  local hsl = rgb_to_hsl(rgb)
  
  hsl.l = clamp(hsl.l + amount, 0, 1)
  
  local new_rgb = hsl_to_rgb(hsl)
  return rgb_to_hex(new_rgb)
end

-- Darken a color by amount (0-1)
function util.darken(color, amount)
  return util.lighten(color, -(amount or 0.1))
end

-- Saturate a color by amount (0-1)
function util.saturate(color, amount)
  amount = amount or 0.1
  local rgb = hex_to_rgb(color)
  local hsl = rgb_to_hsl(rgb)
  
  hsl.s = clamp(hsl.s + amount, 0, 1)
  
  local new_rgb = hsl_to_rgb(hsl)
  return rgb_to_hex(new_rgb)
end

-- Desaturate a color by amount (0-1)
function util.desaturate(color, amount)
  return util.saturate(color, -(amount or 0.1))
end

-- Blend two colors together
function util.blend(color1, color2, ratio)
  ratio = ratio or 0.5
  local rgb1 = hex_to_rgb(color1)
  local rgb2 = hex_to_rgb(color2)
  
  local blended = {
    r = rgb1.r * (1 - ratio) + rgb2.r * ratio,
    g = rgb1.g * (1 - ratio) + rgb2.g * ratio,
    b = rgb1.b * (1 - ratio) + rgb2.b * ratio,
  }
  
  return rgb_to_hex(blended)
end

return util