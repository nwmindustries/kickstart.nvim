return {'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer',
        toggle_style_key = '<leader>ts'
      }
      vim.cmd.colorscheme 'onedark'
      -- require('onedark').load()
    end,
    -- opts = {
    --   style = 'warmer',
    --   toggle_style_key = '<leader>ts'
    -- },
  }
