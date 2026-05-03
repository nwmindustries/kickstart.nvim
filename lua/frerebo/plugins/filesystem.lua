---------------------------------------------------------------------------------------------------------------------------------------------
local function my_on_attach(bufnr)
    local api = require 'nvim-tree.api'

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function open_and_refocus()
        api.node.open.edit()
        vim.cmd 'NvimTreeFocus'
    end

    api.config.mappings.default_on_attach(bufnr)

    -- vim.keymap.set('n', '<leader>s',   api.node.open.vertical,              opts('Open: Vertical Split'))
    vim.keymap.set('n', '<leader><tab>', api.node.open.tab, opts 'Open: New Tab')
    vim.keymap.set('n', 'K', api.node.navigate.sibling.prev, opts 'Previous Sibling')
    vim.keymap.set('n', 'J', api.node.navigate.sibling.next, opts 'Next Sibling')
    vim.keymap.set('n', 'o', open_and_refocus, opts 'open and refocus')
    vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts 'cd')
    vim.keymap.set('n', 'H', api.tree.change_root_to_parent, opts 'cd ..')
    vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts 'toggle dot')
end

---------------------------------------------------------------------------------------------------------------------------------------------------

---@type LazySpec
local yazi = {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}

local oil = {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}

local nvim_tree = {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        vim.cmd 'highlight NvimTreeModifiedFile guifg=red'
        vim.cmd 'highlight NvimTreeNormal guifg=#98c379'

        require('nvim-tree').setup {
            sync_root_with_cwd = true,
            hijack_cursor = true,
            on_attach = my_on_attach,
            sort = {
                -- files_first = true, -- false
                -- folders_first = true
            },
            update_focused_file = {
                enable = true,
            },
            tab = {
                sync = {
                    open = true,
                    close = true,
                },
            },
            filters = {
                dotfiles = true,
            },
            modified = {
                enable = true,
            },
            renderer = {
                highlight_modified = 'name',
                icons = {
                    glyphs = {
                        modified = '',
                        folder = {
                            -- arrow_closed = ""
                        },
                    },
                },
            },
            view = {
                width = 40,
                number = true,
                float = {
                    enable = false,
                },
            },
        }
    end,
}

return { nvim_tree, oil, yazi }
