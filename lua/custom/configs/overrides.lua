local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "thrift",
    "proto",
    "json",
    "yaml",
    "python",
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
    },
  },
}

M.mason = {
  ensure_installed = {
    -- alpine，mason无法自动安装，已在dockerfile中脚本安装
    -- lua stuff
    -- "lua-language-server",
    -- "stylua",

    -- go stuff
    "gopls",
    "goimports",

    -- bash stuff
    "shfmt",
    "shellcheck",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  --on_attach = function(bufnr)
  --  local api = require "nvim-tree.api"
  --  -- default mappings
  --  api.config.mappings.default_on_attach(bufnr)
  --  vim.keymap.set("n", "<CR>", function()
  --    print "xxxx"
  --    require("nvim-tree.api").node.open.no_window_picker()
  --  end)
  --end,
  git = {
    enable = true,
  },
  -- 关闭文件时自动关闭
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },

  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
}

M.gitsigns = {
  current_line_blame = true,
}

M.telescope = {
  defaults = {
    mappings = {
      n = {
        ["f"] = function(prompt_bufnr)
          local state = require "telescope.state"
          local action_state = require "telescope.actions.state"
          local previewer = action_state.get_current_picker(prompt_bufnr).previewer
          local status = state.get_status(prompt_bufnr)
          -- Check if we actually have a previewer and a preview window
          if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
            return
          end
          previewer:scroll_fn(1)
        end,
        ["d"] = function(prompt_bufnr)
          local state = require "telescope.state"
          local action_state = require "telescope.actions.state"
          local previewer = action_state.get_current_picker(prompt_bufnr).previewer
          local status = state.get_status(prompt_bufnr)
          -- Check if we actually have a previewer and a preview window
          if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
            return
          end
          previewer:scroll_fn(-1)
        end,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git/*",
      "%.zip",
      "%.exe",
      "%.dll",
    },
  },
}

return M
