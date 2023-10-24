local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- local function opts(desc)
  --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

 -- custom mappings
    -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


-- function close_if_last_buffer()
--   local buf_type = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
--   if #vim.api.nvim_list_wins() == 1 and buf_type == 'NvimTree' then
--     vim.cmd('qa')
--   end
-- end
--
-- vim.cmd[[ autocmd BufDelete * lua close_if_last_buffer() ]]



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
    }
  end,
}
