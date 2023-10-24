-- nvim-tree-api.node.open.edit()

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  
  local function open_and_refocus()
    api.node.open.edit()
    vim.cmd('NvimTreeFocus')
  end

 -- custom mappings
    -- default mappings
  api.config.mappings.default_on_attach(bufnr) 
  vim.keymap.set('n', 'o', open_and_refocus, opts('open and refocus')) 
   
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = my_on_attach,
      update_focused_file = {
        enable= true,
      }
    }
  end,
}
