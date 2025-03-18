local sonokai = {
    'sainnhe/sonokai',
    cond = false,

    lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        -- vim.g.sonokai_enable_italic = true

        -- vim.g.sonokai_style = 'atlantis'
        -- vim.g.sonokai_style = 'andromeda'
        vim.g.sonokai_style = 'shusia'
        -- vim.g.sonokai_style = 'maia'
        -- vim.g.sonokai_style = ''
        vim.cmd.colorscheme 'sonokai'
    end
}


local onedark = { {
    'navarasu/onedark.nvim',
    cond = true,
    priority = 1000,
    config = function()
        require('onedark').setup {
            style = 'warm',
            toggle_style_key = '<leader>ts'
        }
        vim.cmd.colorscheme 'onedark'
        -- require('onedark').load()
    end,
}


}

local colorcollection = {
    {
        'rafi/awesome-vim-colorschemes',
        lazy = false,    -- load this plugin immediately
        priority = 1000, -- high priority to ensure it loads early
    },
    {
        'flazz/vim-colorschemes',
        lazy = false,    -- load this plugin immediately
        priority = 1000, -- high priority to ensure it loads early
    },
}

local gato = {
    "catppuccin/nvim",
    cond = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "latte", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false,    -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,    -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,  -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,      -- Force no italic
            no_bold = false,        -- Force no bold
            no_underline = false,   -- Force no underline
            styles = {              -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end


}
vim.opt.termguicolors = true  -- Enable true colors (required for #000000)
vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })  -- Set pitch black background
return {
    colorcollection,
    sonokai,
    onedark,
    gato,
}
