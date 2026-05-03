return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason-lspconfig v2+ setup (uses vim.lsp.enable() / automatic_enable by default)
    -- Custom server configs (capabilities, settings, on_attach, root_dir etc.) are defined
    -- in lua/frerebo/plugins/lsp/lspconfig.lua using the vim.lsp.config API.
    mason_lspconfig.setup({
      -- list of servers for mason to automatically install
      ensure_installed = {
        "ts_ls", -- TypeScript/JavaScript LSP
        "html",
        "cssls",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "jsonls",         -- JSON LSP
        "bashls", -- Bash LSP
        "dockerls", -- Docker LSP
        "yamlls", -- YAML LSP
      },
      -- automatic_enable = true (default): automatically enables installed LSPs via vim.lsp.enable()
    })
  end,
}
