vim.wo.cursorline = true
vim.cmd('autocmd FileType help wincmd L')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
vim.cmd('autocmd FileType html setlocal shiftwidth=4 tabstop=4')

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*",
  command = "set foldexpr=nvim_treesitter#foldexpr()"
})


-- vim.opt.foldtext = 'MyFoldText()'

vim.cmd([[
    :set foldtext=MyFoldText()
    :function MyFoldText()
    :  let line = getline(v:foldstart)
    :  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    :  return v:folddashes .. sub
    :endfunction

]])

vim.api.nvim_exec([[
augroup HelpTagMapping
    autocmd!
    autocmd FileType help nnoremap gt <C-]> :execute 'tag' expand('<cword>')<CR>
augroup END
]], false)



vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.cmd("stopinsert")
    end,
})

