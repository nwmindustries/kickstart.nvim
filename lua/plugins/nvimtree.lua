return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    -- vim.cmd[[highlight NvimTreeCursorLine guifg=violet guibg=black]]
    vim.cmd[[highlight NvimTreeModifiedFile guifg=red]]
    vim.cmd("highlight NvimTreeNormal guifg=#98c379")

    require("nvim-tree").setup {
      sort = {
        files_first = false--[[ true ]]
      },
      sync_root_with_cwd = true,
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local function open_and_refocus()
          api.node.open.edit()
          vim.cmd('NvimTreeFocus')
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'o', open_and_refocus, opts('open and refocus'))
        vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts("cd"))
        vim.keymap.set('n', 'H', api.tree.change_root_to_parent, opts("cd .."))
        vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts("toggle dot"))
      end
      ,

      update_focused_file = {
        enable = true,
      }
    }



  end,
}
