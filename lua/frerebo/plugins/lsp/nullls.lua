return {
  "jay-babu/mason-null-ls.nvim",
  cond = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "jq",
        "bashls",
        "lua_ls",
        "yamllint",
        "luacheck",
        "beautysh",
        "jq",
        "luaformatter",
        "markdownlint",
        "htmlbeautifier",
        "semgrep",
        "shellcheck",


      },
      automatic_installation = false,
      handlers = {},
    })
    -- require("null-ls").setup({
    --     sources = {
    --         -- Anything not supported by mason.
    --     }
    -- })
  end,
}
