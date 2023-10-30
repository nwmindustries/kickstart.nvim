return {
  
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  -- config = true,
  -- cond = false, -- Disabled temporarily
  -- config = function()
  --   require('dashboard').setup {
  --     theme = 'hyper'
  --     -- config
  --   }
  -- end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
