vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--@TODO HOLYSHITIMPORTANT TEMPORARIL REVERSING THE ORDER OF REQUIRING CORE AND LAYZ (in josean, he loads core, then lazy)
require("frerebo.lazy")
require("frerebo.core")
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')




