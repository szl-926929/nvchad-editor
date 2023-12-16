---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

M.ui = {
  theme = "chadracula",
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
vim.cmd "hi GitSignsCurrentLineBlame guifg=#777777"

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- 改善lint错误提示
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- 取消代码后面显示提示信息
vim.diagnostic.config {
  -- the message show after the current line
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
  float = {
    style = "minimal",
    border = "rounded",
  },
}
return M
