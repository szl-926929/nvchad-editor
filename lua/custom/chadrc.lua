---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

M.ui = {
  theme = "chocolate",
  -- theme_toggle = { "onedark", "one_light" },

  statusline = {
    separator_style = "block",
  },

  -- hl_override = highlights.override,
  -- hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

vim.cmd "hi Comment guifg=#888888"
vim.cmd "hi Visual guibg=#555555"
vim.cmd "hi Cursorline guibg=one_bg"
vim.cmd "hi LineNr guifg=#888888"

return M
