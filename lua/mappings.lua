-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n', 'v'}, 'q', '<Nop>', {silent=true})
vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<M-k>', '2<C-Y>', {silent=true})
vim.keymap.set('n', '<M-j>', '2<C-E>', {silent=true})

-- vim.keymap.set('n', '<leader>e', ":NvimTreeToggle")

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", {silent=true})

-- Window navigation
vim.keymap.set({'n', 'c'}, '<C-j>', "<C-w>j", {silent=true})
vim.keymap.set({'n', 'c'}, '<C-h>', "<C-w>h", {silent=true})
vim.keymap.set({'n', 'c'}, '<C-l>', "<C-w>l", {silent=true})
vim.keymap.set({'n', 'c'}, '<C-k>', "<C-w>k", {silent=true})

vim.keymap.set({'n', 'v'}, "L", "$", {silent=true})
vim.keymap.set({'n', 'v'}, "H", "0", {silent=true})

vim.keymap.set('n', 'U', '<C-r>', {silent=true})

-- Buffers and tabs
vim.keymap.set('n', 'bx', '<cmd>bd<cr>', {silent=true})
vim.keymap.set('n', 'bh', '<cmd>bprevious<cr>', {silent=true})
vim.keymap.set('n', 'bn', '<cmd>bnext<cr>', {silent=true})
vim.keymap.set('n', 'bs', '<cmd>vsplit<cr>', {silent=true})
vim.keymap.set('n', 'tl', 'gt', {silent=true})
vim.keymap.set('n', 'th', 'gT', {silent=true})
vim.keymap.set('n', 'tx', '<cmd>tabclose<cr>', {silent=true})
vim.keymap.set('n', '<leader>ta', '<cmd>tab ba<cr>', {silent=true}) -- open all buffers in tabs

vim.keymap.set('n', '<M-[>', '<cmd>vertical resize +2<cr>', {silent=true})
vim.keymap.set('n', '<M-]>', '<cmd>vertical resize -2<cr>', {silent=true})




vim.api.nvim_set_keymap('n', 'J', ':normal o<Esc>', {noremap = true, silent = true}) --Insert blank line
--Mappings from original kicktstart init.nvim


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


























