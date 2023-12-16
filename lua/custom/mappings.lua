---@type MappingsTable
--
local M = {}

----------------------
--lsp
----------------------
-- K: 显示文档，再次K，进入文档窗口中，q退出
-- gD: 跳转到声明
-- gd：跳转到定义
-- gi: 查找接口的实现
-- <leader>ra: 一建修改类型名和所有调用的地方，会在bar标签中打开所有修改的文件
-- gr: 列出调用的地方
-- <leader>d: focus diagnostic, 主要是lint错误信息框
-- ctrl+w: 光标切出diagnostic
-- <leader>h：水平终端, esc: ctrl+w，切出终端
-- <leader>z：vim窗口全屏
-- <leader>q: 展示lint提示列表
-- [d: 上一个lint提示
-- ]d: 下一个lint提示

-- more keybinds!

M.eft = {
  n = {
    f = { "<Plug>(eft-f)", "eft-f" },
    F = { "<Plug>(eft-F)", "eft-F" },
    t = { "<Plug>(eft-t)", "eft-t" },
    T = { "<Plug>(eft-T)", "eft-T" },
    [";"] = { "<Plug>(eft-repeat)", "eft-repeat" },
  },
}

M.accelerated_jk = {
  n = {
    j = { "<Plug>(accelerated_jk_gj)", "accelerated gj movement" },
    k = { "<Plug>(accelerated_jk_gk)", "accelerated gk movement" },
  },
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols symbol_width=50 <CR>", "lsp document symbols" },
  },
}

M.hop = {
  n = {
    ["<leader><leader>w"] = { "<cmd> HopWord <CR>", "hint all words" },
    ["<leader><leader>b"] = { "<cmd> HopWord <CR>", "hint all words" },
    ["<leader><leader>j"] = { "<cmd> HopLine <CR>", "hint line" },
    ["<leader><leader>k"] = { "<cmd> HopLine <CR>", "hint line" },
  },
}

-- 文件操作
-- :sp：水平分割窗口打开当前文件
-- :vsp：垂直窗口打开当前文件
-- :new 文件名 水平窗口打开新文件
-- :vnew 文件名 垂直窗口打开新文件

-- sf: 在目录中显示文件
-- t: 在table中打开文件
-- _: 水平分割显示文件
-- -: up到上一层
-- +: 垂直平分割显示文件
-- a: 创建文件
-- d: 删除文件
-- r: 文件重命名
-- u: 文件路径重命名
-- R: 刷新
-- c: 文档拷贝到粘贴板
M.nvimtree = {
  n = {
    --["<CR>"] = {
    --  function()
    --    print "xxxxxxxx"
    --    require("nvim-tree.api").node.open.no_window_picker()
    --  end,
    --  "open",
    --},
    -- focus
    ["<leader>z"] = {
      function()
        require("windex").toggle_nvim_maximize()
      end,
      "Toggle Maximize Current Windown",
    },
    ["sf"] = {
      function()
        local function starts_with(String, Start)
          return string.sub(String, 1, string.len(Start)) == Start
        end

        local cwd = vim.fn.getcwd()
        local cur_path = vim.fn.expand "%:p:h"
        local cur_file_path = vim.fn.expand "%:p"
        if starts_with(cur_path, cwd) then
          --require('nvim-tree.api').tree.toggle({path=cur_path, update_root=cwd})
          require("nvim-tree.api").tree.find_file { open = true, focus = true, buf = cur_file_path, update_root = cwd }
        else
          --require('nvim-tree.api').tree.toggle({path=cur_path})
          require("nvim-tree.api").tree.find_file {
            open = true,
            focus = true,
            buf = cur_file_path,
            update_root = cur_path,
          }
        end
      end,
      "show file in tree",
    },
    -- P: Parent Directory
    -- R: Refresh
    ["t"] = {
      function()
        local api = require "nvim-tree.api"
        api.node.open.tab()
      end,
      "opened in a new tab",
    },

    ["_"] = {
      function()
        local api = require "nvim-tree.api"
        api.node.open.horizontal()
      end,
      "Open: Horizontal Split",
    },

    ["+"] = {
      function()
        local api = require "nvim-tree.api"
        api.node.open.vertical()
      end,
      "Open: Vertical Split",
    },
    ["<leader>t"] = { ":NvimTreeResize ", "resize tree xxx" },
    ["tl"] = { "<cmd>NvimTreeResize +10<CR>", "nvimtree resize +10" },
    ["th"] = { "<cmd>NvimTreeResize -10<CR>", "nvimtree resize -10" },
  },
}

M.general = {
  t = {
    ["<ESC>"] = { "<C-\\><C-n>", "escape terminal mode", opts = { nowait = true } },
  },
  n = {
    --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>d"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "focus diagnostic" },
    ["tc"] = { "<cmd>tabc<CR>", "close current tab" },
    ["t1"] = { "<cmd>tabnext 1<CR>", "choose 1 tab" },
    ["t2"] = { "<cmd>tabnext 2<CR>", "choose 2 tab" },
    ["t3"] = { "<cmd>tabnext 3<CR>", "choose 3 tab" },
    ["t4"] = { "<cmd>tabnext 4<CR>", "choose 4 tab" },
    ["<leader>c"] = { "<cmd>cclose<CR>", "close quickfix" },
    ["<F8>"] = { "<cmd>TagbarToggle<CR>", "open tagbar" },
  },
}

-- M.nvterm = {
--   n = {
--     ["<C--"] = {
--       function()
--         print "==========="
--         require("nvterm.terminal").send("zsh", "horizontal")
--       end,
--       "open terminal in horizontal",
--     },
--   },
-- }

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    [";fd"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}

M.tabufline = {
  n = {
    ["<tab>"] = { "<tab>", "tab" },
  },
}

return M
