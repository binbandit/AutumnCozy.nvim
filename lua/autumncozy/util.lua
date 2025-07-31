local util = {}

-- Simple HSL-based lighten/darken (requires no external libs; approximate)
function util.lighten(color, amount)
  local r, g, b = tonumber(color:sub(2,3),16)/255, tonumber(color:sub(4,5),16)/255, tonumber(color:sub(6,7),16)/255
  local max = math.max(r, g, b)
  local min = math.min(r, g, b)
  local l = (max + min) / 2
  l = math.min(1, l + (amount or 0.1))
  local function to_hex(c) return string.format("%02x", math.floor(c * 255)) end
  return "#" .. to_hex(r + (l - (r+g+b)/3)) .. to_hex(g + (l - (r+g+b)/3)) .. to_hex(b + (l - (r+g+b)/3))
end

function util.darken(color, amount)
  return util.lighten(color, -(amount or 0.1))
end

return util