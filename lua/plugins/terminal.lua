return {
--   {'akinsho/toggleterm.nvim', version = "*", config = true}
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup{
      open_mapping = [[<leader>\]]
    }
  end
}
