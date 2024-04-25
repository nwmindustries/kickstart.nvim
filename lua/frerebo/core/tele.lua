
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    -- Your other defaults
  },
  pickers = {
    help_tags = {
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          vim.cmd('vertical help ' .. selection.value .. ' | wincmd L')
        end)
        map('n', '<CR>', function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          vim.cmd('vertical help ' .. selection.value .. ' | wincmd L')
        end)
        return true
      end,
    },
  },
}
