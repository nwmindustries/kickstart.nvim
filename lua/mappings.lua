-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n', 'v'}, 'q', '<Nop>', {silent=true})
vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<M-k>', '<C-Y>', {silent=true})
vim.keymap.set('n', '<M-j>', '<C-E>', {silent=true})

-- vim.keymap.set('n', '<leader>e', ":NvimTreeToggle")

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", {silent=true})

vim.keymap.set('n', '<C-j>', "<C-w>j", {silent=true})
vim.keymap.set('n', '<C-h>', "<C-w>h", {silent=true})
vim.keymap.set('n', '<C-l>', "<C-w>l", {silent=true})
vim.keymap.set('n', '<C-k>', "<C-w>k", {silent=true})








--Mappings from original kicktstart init.nvim


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


























