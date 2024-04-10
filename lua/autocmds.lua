vim.cmd('autocmd FileType help wincmd L')


function ChangeCursorOnBlankLine()
  local line_content = vim.fn.getline('.')
  if line_content == '' then
    vim.cmd('hi Cursor guifg=red guibg=red')
  else
    vim.cmd('hi Cursor guifg=NONE guibg=NONE')
  end
end

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
vim.cmd('autocmd FileType html setlocal shiftwidth=4 tabstop=4')

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*",
  command = "set foldexpr=nvim_treesitter#foldexpr()"
})

-- TODO: FIGURE OUT HOW TO fold-foldtext
