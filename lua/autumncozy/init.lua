-- AutumnCozy setup module
local M = {}

local config = require('autumncozy.config')
local theme = require('autumncozy.theme')
local palette = require('autumncozy.palette')

-- Setup function
M.setup = function(opts)
  -- Configure options
  config.setup(opts)
  
  -- Check cache if enabled
  local conf = config.get()
  if conf.cache and theme.load_from_cache() then
    -- Successfully loaded from cache
    return
  end
  
  -- Load theme
  theme.load()
end

-- Export colors for external use
M.get_colors = function()
  return palette.get_colors()
end

-- Export configuration
M.get_config = function()
  return config.get()
end

-- Force reload (bypass cache)
M.reload = function()
  package.loaded['autumncozy'] = nil
  package.loaded['autumncozy.config'] = nil
  package.loaded['autumncozy.theme'] = nil
  package.loaded['autumncozy.palette'] = nil
  package.loaded['autumncozy.util'] = nil
  package.loaded['autumncozy.variants'] = nil
  
  require('autumncozy').setup(config.get())
end

return M