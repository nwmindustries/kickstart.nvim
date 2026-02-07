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

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "typescript-language-server", -- TypeScript/JavaScript LSP
        "html-lsp",
        "css-lsp",
        "svelte-language-server",
        "lua-language-server",
        "graphql-language-service-cli",
        "emmet-ls",
        "prisma-language-server",
        "pyright",
        "json-lsp",         -- JSON LSP
        "bash-language-server", -- Bash LSP
        "dockerfile-language-server", -- Docker LSP
        "yaml-language-server", -- YAML LSP
      },
    })
  end,
}
