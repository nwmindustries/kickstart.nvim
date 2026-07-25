vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.env.XAI_API_KEY = vim.env.XAI_API_KEY or os.getenv("XAI_API_KEY")
if not vim.env.XAI_API_KEY then
  vim.notify("XAI_API_KEY not set! Set it in your shell or here.", vim.log.levels.WARN)
end

-- Override grok-beta deprecation in codecompanion xai adapter (runtime evidence from avante.lua logs + successful H6 logs + init.lua execution)
pcall(function()
  local ok, adapters = pcall(require, "codecompanion.adapters")
  if ok then
    adapters.extend("xai", {
      schema = {
        model = {
          default = "grok-3",
          choices = { "grok-3", "grok-3-fast", "grok-code-fast-1" },
        },
      },
    })
  end
end)

--@TODO HOLYSHITIMPORTANT TEMPORARIL REVERSING THE ORDER OF REQUIRING CORE AND LAYZ (in josean, he loads core, then lazy)
require("frerebo.lazy")
require("frerebo.core")
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- fvim configs?? --


-- Enable anti-aliasing
vim.g.fvim_font_antialias = true

-- Set the font
vim.g.fvim_font = "JetBrainsMono Nerd Font:h14"

-- Enable ligatures
vim.g.fvim_font_ligature = true

-- Optional: Disable transparency
vim.g.fvim_transparent = false



