-- AutumnCozy main module
-- This file can be required directly or through the colors/autumncozy.vim wrapper

local M = {}

M.load = function()
  -- Load the colorscheme from colors/autumncozy.lua
  vim.cmd('runtime colors/autumncozy.lua')
end

-- Auto-load when required
M.load()

return M