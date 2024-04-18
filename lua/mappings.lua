vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n', 'v'}, 'q', '<Nop>', {silent=true})
vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", {silent=true})

-- Editing
vim.keymap.set({'n','v'}, "x", '"_x')

-- Navigation
vim.keymap.set({'n', 'v'}, "L", "$", {silent=true})
vim.keymap.set({'n', 'v'}, "H", "0", {silent=true})

vim.keymap.set('n', 'U', '<C-r>', {silent=true})

-- Windows and buffers 
vim.keymap.set('n', 'bx', '<cmd>bd<cr>', {silent=true})
vim.keymap.set('n', 'bc', '<cmd>close<cr>', {silent=true}) --window close
vim.keymap.set('n', 'bs', '<cmd>vsplit<cr>', {silent=true})
vim.keymap.set('n', 'tx', '<cmd>tabclose<cr>', {silent=true})


-- Tabs
vim.keymap.set('n', '<leader>ta', '<cmd>tab ba<cr>', {silent=true, desc = "open all buffers in tabs"}) -- open all buffers in tabs
vim.keymap.set('n', 'te', '<cmd>tabedit %<cr>', {silent=true, noremap=true, desc = "open current buffer in new tabpage"}) -- Opens current buffer in a new tabpage 


vim.keymap.set('n', '<M-h>', '<cmd>bprevious<cr>', {silent=true, desc = "switch window to previous buffer"})
vim.keymap.set('n', '<M-l>', '<cmd>bnext<cr>', {silent=true, desc = "switch window to next buffer"})

vim.keymap.set('n', '<leader>ch', '<cmd>ChatGPT<cr>', {silent=true, desc= "open ChatGPT"})

vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>', {desc = "opens a new empty tab page"})
vim.keymap.set('n', '<tab>', 'gt', {silent=true, noremap=true, desc = "move to next tab page"})  -- moves to next tab page. Idfk maybe delete this
vim.keymap.set('n', '<S-tab>', 'gT', {silent=true, noremap=true, desc = "Move to previous tab"})  -- moves to previous tab page. Idfk maybe delete this
vim.keymap.set('n', 'to', '<cmd>tabedit % | tabprevious<cr>', {noremap=true, desc = "Open buffer in new tabpage but dont switch"})
vim.keymap.set('n', 'th', '<cmd>tabmove -1<cr>', {noremap=true, silent=true, desc = "Move current tab page to the left"})
vim.keymap.set('n', 'tl', '<cmd>tabmove +1<cr>', {noremap=true, silent=true, desc = "Move current tab page to the righta"})
-- Scrolling and window resizing
vim.keymap.set('n', '<M-[>', '<cmd>vertical resize +4<cr>', {silent=true, noremap=true, nowait=true})
vim.keymap.set('n', '<M-]>', '<cmd>vertical resize -4<cr>', {silent=true, noremap=true, nowait=true})
vim.keymap.set({'n', 'v'}, '<M-k>', '3<C-Y>', {silent=true, desc = "scroll up"}) -- scroll up
vim.keymap.set({'n', 'v'}, '<M-j>', '3<C-E>', {silent=true}) -- scroll down


vim.keymap.set('i', '<C-p>', '<C-r>+', {silent=true})
vim.api.nvim_set_keymap('n', 'J', 'O<Esc>', { noremap = true, silent = true, desc = "Moves line Down" })
-----------Mappings from original kicktstart init.nvim---------------------


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


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

-- HIGHLIGHT-CURRENT-N

vim.cmd([[
" Map keys
nmap n <Plug>(highlight-current-n-n)
nmap N <Plug>(highlight-current-n-N)

" If you want the highlighting to take effect in other maps they must
" also be nmaps (or rather, not "nore").
"
" * will search <cword> ahead, but it can be more ergonomic to have *
" simply fill the / register with the current <cword>, which makes future
" commands like cgn "feel better". This effectively does that by performing
" "search ahead <cword> (*), go back to last match (N)".
nmap * *N

" Some QOL autocommands
augroup ClearSearchHL
  autocmd!
  " You may only want to see hlsearch /while/ searching, you can automatically
  " toggle hlsearch with the following autocommands
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
  " this will apply similar n|N highlighting to the first search result
  " careful with escaping ? in lua, you may need \\?
  autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
augroup END

]])


















