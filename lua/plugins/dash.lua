return {
  
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = true,
  -- config = function()
  --   require('dashboard').setup {
  --     theme = 'hyper'
  --     -- config
  --   }
  -- end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
