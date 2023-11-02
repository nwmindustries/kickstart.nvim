vim.cmd('autocmd FileType help wincmd L')
-- vim.cmd [[ autocmd VimEnter * NvimTreeOpen ]]
-- vim.cmd [[
--   autocmd BufDelete * if (winnr('$') == 1 && &filetype == 'NvimTree') | q | endif
-- ]]

function ChangeCursorOnBlankLine()
  local line_content = vim.fn.getline('.')
  if line_content == '' then
    vim.cmd('hi Cursor guifg=red guibg=red')
  else
    -- Reset cursor color to your preference or default
    vim.cmd('hi Cursor guifg=NONE guibg=NONE')
  end
end
