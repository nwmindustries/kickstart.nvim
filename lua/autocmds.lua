vim.cmd('autocmd! FileType help wincmd L')
vim.cmd [[ autocmd VimEnter * NvimTreeOpen ]]
-- vim.cmd [[
--   autocmd BufDelete * if (winnr('$') == 1 && &filetype == 'NvimTree') | q | endif
-- ]]
