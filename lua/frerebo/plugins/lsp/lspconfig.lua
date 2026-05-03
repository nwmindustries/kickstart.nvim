return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin (nvim-lspconfig is loaded via its plugin spec and require("lspconfig.util"))
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Show LSP info"
        keymap.set("n", "<leader>li", ":LspInfo<CR>", opts) -- show LSP info

        opts.desc = "Format code"
        keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, opts) -- format code
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure LSP servers using the new vim.lsp.config API (Neovim 0.11+ / mason-lspconfig v2+)
    -- This replaces the deprecated mason_lspconfig.setup_handlers() / handlers table that was removed.
    -- mason-lspconfig's automatic_enable (default: true) will now use these configs via vim.lsp.enable()
    -- Common keymaps and capabilities are handled via LspAttach autocmd + cmp_nvim_lsp

    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    }

    vim.lsp.config.svelte = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            -- Here use ctx.match instead of ctx.file (for svelte LSP TS integration)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    }

    vim.lsp.config.graphql = {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }

    vim.lsp.config.emmet_ls = {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      root_dir = require("lspconfig.util").root_pattern(
        ".luarc.json", -- Look for .luarc.json
        ".git", -- Or a .git directory
        "wezterm.lua", -- Or the WezTerm config file
        "rc.lua" -- Or the AwesomeWM config file
      ) or vim.fn.getcwd(),
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = {
              "?.lua",
              "?/init.lua",
              vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
              vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
              "/usr/share/5.3/?.lua",
              "/usr/share/lua/5.3/?/init.lua",
            },
          },
          workspace = {
            library = {
              vim.fn.expand("~/.luarocks/share/lua/5.3"),
              "/usr/share/lua/5.3",
              ["/usr/share/awesome/lib"] = true,
              [vim.fn.expand("~/.config/awesome")] = true,
              [vim.fn.expand("~/.local/share/wezterm-types")] = true,
              ["/usr/share/nvim/runtime/lua/vim"] = true,
              [vim.fn.stdpath("data") .. "/lazy"] = true, -- Lazy plugin directory
            },
            checkThirdParty = false,
          },
          diagnostics = {
            globals = { "wezterm", "vim", "awesome", "client", "screen", "root", "mouse" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
      cmd = { "lua-language-server", "--log-level=trace" },
    }

    -- Other servers (html, cssls, pyright, jsonls, bashls, etc.) will use their default configs from nvim-lspconfig
    -- via mason-lspconfig's automatic_enable feature.
  end,
}
