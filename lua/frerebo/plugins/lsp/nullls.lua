return {
  "jay-babu/mason-null-ls.nvim",
  cond = false, -- Temporarily disabled due to null-ls errors
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",          -- Lua formatter
        "jq",              -- JSON processor/formatter
        "yamllint",        -- YAML linter
        "luacheck",        -- Lua linter
        "beautysh",        -- Bash formatter
        "markdownlint",    -- Markdown linter
        "htmlbeautifier",  -- HTML formatter
        "semgrep",         -- Static analysis
        "shellcheck",      -- Shell script linter
      },
      automatic_installation = true,
      handlers = {},
    })

    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.stylua,

        -- Linters
        null_ls.builtins.diagnostics.markdownlint,

        -- Only include sources that are actually installed
        -- null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.beautysh,
        -- null_ls.builtins.formatting.htmlbeautifier,
        -- null_ls.builtins.diagnostics.yamllint,
        -- null_ls.builtins.diagnostics.luacheck,
        -- null_ls.builtins.diagnostics.semgrep,
        -- null_ls.builtins.diagnostics.shellcheck,
        -- null_ls.builtins.code_actions.shellcheck,
      },
    })
    -- require("null-ls").setup({
    --     sources = {
    --         -- Anything not supported by mason.
    --     }
    -- })
  end,
}
