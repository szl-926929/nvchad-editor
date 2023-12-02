local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.backup = false
--opt.swapfile = false

opt.scrolloff = 10
opt.relativenumber = true
opt.wrap = false
--opt.syntax = true
opt.mouse = nil
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true


--autocmd("BufWritePre", {
--  pattern = "*.go",
--  callback = function()
--    vim.lsp.buf.format { async = false }
--  end,
--})

-- 选中复制的内容：v+hjkl，复制：y，粘贴：p
-- vim和系统共有粘贴板
-- :register "" 可以查看unnamed寄存器中的内容
-- " 多次粘贴
-- cmd([[let $DISPLAY=unnamedplus]])
cmd [[set pastetoggle=<F2>]]
cmd [[set clipboard^=unnamed]]
cmd [[xnoremap p pgvy]]

-- 只剩下tree的时候，关闭tree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end,
})

-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format { async = true }")

-- autocmd("FileType", {
--   pattern = { "c", "cpp", "lua", "sh", "go" },
--   callback = function()
--     autocmd("BufWritePre", {
--       callback = function()
--         --vim.lsp.buf.format { async = true }
--         vim.lsp.buf.format {}
--       end,
--     })
--   end,
-- })

-- 代码折叠
-- za：打开或关闭当前折叠
-- zM: 折叠所有代码
-- zR: 展开所有折叠的代码
opt.foldmethod = "expr" -- fold with nvim_treesitter
opt.foldexpr = "nvim_treesitter#foldexpr()" --fold with nvim_treesitter
opt.foldenable = false -- no fold when open a file
opt.foldlevel = 99
-- fix: Telescope 打开文件无法折叠，必须:e重新加载后才可以
