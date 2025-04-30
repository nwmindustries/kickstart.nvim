local bar_bar = {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    cond = false,
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

local neogit = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true,
  cond = false
}

local kmonad = {
  'kmonad/kmonad-vim'
}

local nvim_gui = {
  "equalsraf/neovim-gui-shim"
}

local highlight_current = {
  "rktjmp/highlight-current-n.nvim"
}

local startify_dash = {
  'mhinz/vim-startify',
  init = function()
    vim.g.startify_custom_header = ''
  end

}

local folding = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async" },
  -- config = true,
  -- event = 'BufAdd'
  cond = false
}

local rainbows = {
  "HiPhish/rainbow-delimiters.nvim"
}

-- NOT RETURNED!!!!!!!!!!!!!!!!!
local wezterm_mux_navigator = {
  "jonboh/wezterm-mux.nvim"
}


return {
  nvim_gui,
  folding,
  startify_dash,

  highlight_current,
  kmonad,
  neogit,
  bar_bar,
  rainbows,
}
