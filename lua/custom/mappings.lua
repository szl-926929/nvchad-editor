---@type MappingsTable
--
local M = {}

M.general = {
  -- n = {
  --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
  -- },
  t = {
    ["<ESC>"] = { "<C-\\><C-n>", "escape terminal mode", opts = { nowait = true } },
  },
}

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

-- sf: 在目录中显示文件
--
-- t: 在table中打开文件
-- _: 水平分割显示文件
-- +: 垂直平分割显示文件
-- a: 创建文件
-- d: 删除文件
M.nvimtree = {
  n = {
    -- focus
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
  },
}

M.general = {
  n = {
    ["tc"] = { "<cmd>tabc<CR>", "close current tab" },
    ["t1"] = { "<cmd>tabnext 1<CR>", "choose 1 tab" },
    ["t2"] = { "<cmd>tabnext 2<CR>", "choose 2 tab" },
    ["t3"] = { "<cmd>tabnext 3<CR>", "choose 3 tab" },
    ["t4"] = { "<cmd>tabnext 4<CR>", "choose 4 tab" },
    ["<leader>c"] = { "<cmd>cclose<CR>", "close quickfix" },
    ["<F8>"] = { "<cmd>TagbarToggle<CR>", "open tagbar" },
  },
}

M.nvterm = {
  n = {
    ["<C-=>"] = {
      function()
        require("nvterm.terminal").send("zsh", "horizontal")
      end,
      "open terminal in horizontal",
    },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    [";fd"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}

return M
