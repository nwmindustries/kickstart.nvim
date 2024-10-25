-- Anonymous function that doubles a number
local result = (function(x) return x * 2 end)(5)
print(result) -- Output: 10



local km = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
km.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
km.set({ 'n', 'v' }, 'q', '<Nop>', { silent = true })
km.set('n', ';', ':')

km.set('n', '<leader>e', ":NvimTreeToggle<CR>", { silent = true })

-- Editing
km.set({ 'n', 'v' }, "x", '"_x')

-- Navigation
km.set({ 'n', 'v' }, "L", "$", { silent = true })
km.set({ 'n', 'v' }, "H", "0", { silent = true })

km.set('n', 'U', '<C-r>', { silent = true })

-- Windows and buffers
km.set('n', 'bx', '<cmd>bd<cr>', { silent = true, desc = "cmd bd" })
km.set('n', 'bc', '<cmd>close<cr>', { silent = true, desc ="cmd close"}) --window close
km.set('n', 'bs', '<cmd>vsplit<cr>', { silent = true, desc = "vertical split" })
km.set('n', 'tx', '<cmd>tabclose<cr>', { silent = true, desc = "tab close"})


-- Tabs
km.set('n', '<leader>ta', '<cmd>tab ba<cr>', { silent = true, desc = "open all buffers in tabs" })                      -- open all buffers in tabs
km.set('n', 'te', '<cmd>tabedit %<cr>', { silent = true, noremap = true, desc = "open current buffer in new tabpage" }) -- Opens current buffer in a new tabpage

km.set('n', '<leader>st', '<cmd>Telescope<cr>', { silent = true, noremap = true, desc = "open telescope" })


km.set('n', 'tn', '<cmd>tabnew<cr>', { desc = "opens a new empty tab page" })
km.set('n', 'tl', 'gt', { silent = true, noremap = true, desc = "move to next tab page" })  -- moves to next tab page. Idfk maybe delete this
km.set('n', 'th', 'gT', { silent = true, noremap = true, desc = "Move to previous tab" }) -- moves to previous tab page. Idfk maybe delete this
km.set('n', 'to', '<cmd>tabedit % | tabprevious<cr>', {
  noremap = true,
  desc =
  "Open buffer in new tabpage but dont switch"
})

-- Scrolling and window resizing
km.set({ 'n', 'v' }, '<M-k>', '5<C-Y>', { silent = true, desc = "scroll up" }) -- scroll up
km.set({ 'n', 'v' }, '<M-j>', '5<C-E>', { silent = true, desc = "scroll down" }) -- scroll up


km.set('i', '<C-p>', '<C-r>+', { silent = true })
vim.api.nvim_set_keymap('n', 'J', 'O<Esc>', { noremap = true, silent = true, desc = "Moves line Down" })
vim.api.nvim_set_keymap('n', 'O', 'J<Esc>', { noremap = true, silent = true, desc = "Joins Line" })

-- Keymaps for better default experience
-- See `:help km.set()`
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--telescope mappings

-- See `:help telescope.builtin`
km.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- km.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
km.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

km.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
km.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
km.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
km.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
km.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
km.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
km.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
km.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
-- HIGHLIGHT-CURRENT-N


-- Remap change and delete commands to use the black hole register
local function map_change_delete_to_black_hole()
  -- List of change commands
  local change_commands = { 'c', 'C', 'cw', 'c$', 'c0', 'ciw', 'ci"', 'ci\'', 'ci(', 'ci{', 'ci[' }
  -- List of delete commands
  local delete_commands = { 'd', 'D', 'dw', 'd$', 'd0', 'diw', 'di"', 'di\'', 'di(', 'di{', 'di[' }

  for _, cmd in ipairs(change_commands) do
    vim.api.nvim_set_keymap('n', cmd, '"_' .. cmd, { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', cmd, '"_' .. cmd, { noremap = true, silent = true })
  end

  for _, cmd in ipairs(delete_commands) do
    vim.api.nvim_set_keymap('n', cmd, '"_' .. cmd, { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', cmd, '"_' .. cmd, { noremap = true, silent = true })
  end
end

-- Apply the mappings
map_change_delete_to_black_hole()

-- Function to remap x to delete to the system clipboard
local function map_cut_to_clipboard()
  vim.api.nvim_set_keymap('n', 'x', '"+x', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'x', '"+d', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'X', '"+X', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'X', '"+d', { noremap = true, silent = true })
end

-- Apply the mappings
map_cut_to_clipboard()

vim.cmd([[command! Fuckthis qa!]])

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})





-- Both visual and normal mode for each, so you can open with a visual selection or without.
vim.api.nvim_set_keymap('v', '<leader>gc', ':GPTModelsCode<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':GPTModelsCode<CR>', { noremap = true })

vim.api.nvim_set_keymap('v', '<leader>gp', ':GPTModelsChat<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':GPTModelsChat<CR>', { noremap = true })
