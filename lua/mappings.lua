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
-----------Mappings from original kicktstart init.nvim---------------------


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--telescope mappings

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })





















