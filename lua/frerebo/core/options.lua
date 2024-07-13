-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
vim.g.nvim_tree_hide_dotfiles = 1
-- vim.opt.relativenumber = true
vim.o.numberwidth = 4
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.hlsearch = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.o.foldmethod="expr"
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

-- Set the 'stc' option to display relative line numbers or absolute line numbers
-- vim.o.stc = '%=%{v:relnum?v:relnum:v:lnum} '



-- vim.cmd([[
--   highlight EmptyLine ctermbg=black guibg=black
--   autocmd CursorMoved,CursorMovedI * if getline('.') == '' | highlight CursorLine ctermbg=black guibg=black | endif
-- ]])




-- vim.cmd [[
--   highlight CursorLineNr guifg=#ff0000 guibg=#660066 gui=bold 
-- ]]
