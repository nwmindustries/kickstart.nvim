-- #region agent debug logging (H1-H5)
local function agent_log(hypothesisId, message, data)
  local log_path = "/home/frerebo/.config/nvim/.cursor/debug-f8075b.log"
  local timestamp = math.floor(os.time() * 1000)
  local id = "log_" .. timestamp .. "_" .. math.random(10000, 99999)
  local location = "lua/frerebo/plugins/avante.lua:unknown"
  -- Try to get better location
  local info = debug.getinfo(2, "Sl")
  if info and info.currentline then
    location = "lua/frerebo/plugins/avante.lua:" .. info.currentline
  end
  local entry = {
    sessionId = "f8075b",
    id = id,
    timestamp = timestamp,
    location = location,
    message = message,
    data = data or {},
    runId = "initial",
    hypothesisId = hypothesisId,
  }
  local ok, json_str = pcall(vim.json.encode, entry)
  if ok then
    local f = io.open(log_path, "a")
    if f then
      f:write(json_str .. "\n")
      f:close()
    end
  end
end
-- #endregion

-- #region agent log - module entry (tests H4,H5,H6,H7 - new run)
agent_log("H4", "avante.lua module loading started", {
  file = "lua/frerebo/plugins/avante.lua",
  lazy_import_expected = true,
  runId = "post-adapter-fix",
  has_xai_override = true,
  version_fixed = true,
  hypothesis = "H7_module_load"
})
-- #endregion

local avante = {
    'yetone/avante.nvim',
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        -- add any opts here
        -- this file can contain specific instructions for your project
        instructions_file = 'avante.md',
        -- for example
        provider = 'grok',
        providers = {
            grok = {
                __inherited_from = 'openai',
                endpoint = 'https://api.x.ai/v1',
                model = 'grok-code-fast-1',
                api_key_name = 'XAI_API_KEY',
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 20480,
                },
            }, ---
            moonshot = {
                endpoint = 'https://api.moonshot.ai/v1',
                model = 'kimi-k2-0711-preview',
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 32768,
                },
            },
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        --- The below dependencies are optional,
        'nvim-mini/mini.pick', -- for file_selector provider mini.pick
        'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
        'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
        'ibhagwan/fzf-lua', -- for file_selector provider fzf
        'stevearc/dressing.nvim', -- for input provider dressing
        'folke/snacks.nvim', -- for input provider snacks
        'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
        'zbirenbaum/copilot.lua', -- for providers='copilot'
        {
            -- support for image pasting
            'HakonHarnes/img-clip.nvim',
            event = 'VeryLazy',
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
}

-- #region agent log - after avante spec (tests H5)
agent_log("H5", "avante spec fully defined", {spec_size=#avante.dependencies or 0, event="VeryLazy", provider="grok"})
-- #endregion

local ai_bro = {
    'olimorris/codecompanion.nvim',
    -- #region agent log H1 - version check
    version = '^19.0.0',
    -- #endregion

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'ravitemer/mcphub.nvim', -- ensures mcphub loads before codecompanion
    },
    opts = {
        extensions = {
            mcphub = {
                callback = 'mcphub.extensions.codecompanion',
                opts = {
                    interactions = {
                        chat = {
                            adapter = {
                                name = 'xai',
                                model = 'grok-3',  -- updated from grok-code-fast-1 to avoid deprecation
                            },
                        },

                        inline = {
                            name = 'xai',
                            model = 'grok-3',
                        },
                    },
                    -- MCP Tools
                    make_tools = true, -- expose @server and @server__tool in chat
                    show_server_tools_in_chat = true,
                    add_mcp_prefix_to_tool_names = false,
                    show_result_in_chat = true,
                    -- MCP Resources
                    make_vars = true, -- convert MCP resources to #variables
                    -- MCP Prompts
                    make_slash_commands = true, -- add MCP prompts as /slash commands
                },
            },
        },
    },

    -- #region agent log H6 - adapter override for deprecation (proven by xai.lua source + logs)
    -- Removed (proven to break module load per empty logs). Override added in init.lua below.
    -- #endregion

    keys = {
        { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
        {
            '<leader>ac',
            function()
                -- #region agent log H3,H4 - keymap execution
                agent_log("H3", "CodeCompanionChat Toggle key triggered", {cmd="CodeCompanionChat Toggle", key="<leader>ac"})
                -- #endregion
                vim.cmd 'CodeCompanionChat Toggle'
            end,
            desc = 'Toggle Chat',
            mode = { 'n', 'v' },
        },
        {
            '<leader>ap',
            function()
                -- #region agent log H3,H4 - keymap execution
                agent_log("H3", "CodeCompanionActions key triggered", {cmd="CodeCompanionActions", key="<leader>ap"})
                -- #endregion
                vim.cmd 'CodeCompanionActions'
            end,
            desc = 'Actions',
            mode = { 'n', 'v' },
        },
        { '<leader>ai', '<cmd>CodeCompanion<cr>', desc = 'Inline Prompt', mode = { 'n', 'v' } },
    },
}

-- #region agent log - after ai_bro spec (tests H1,H2,H6)
agent_log("H1", "ai_bro spec defined - checking version and structure (post-fix)", {
  version = ai_bro.version,
  has_extensions = ai_bro.opts and ai_bro.opts.extensions ~= nil,
  has_config = ai_bro.config ~= nil,
  mcphub_configured = true,
  num_dependencies = #ai_bro.dependencies,
  has_keys = #ai_bro.keys > 0,
  runId = "post-adapter-fix"
})
agent_log("H2", "ai_bro mcphub extension config logged", {
  callback = ai_bro.opts.extensions.mcphub.callback,
  interactions_chat_adapter_model = ai_bro.opts.extensions.mcphub.opts.interactions.chat.adapter.model,
  make_tools = ai_bro.opts.extensions.mcphub.opts.make_tools,
})
agent_log("H6", "xai adapter override moved to config (avoids early require)", {
  model_default = "grok-3",
  deprecated_avoided = true,
  runId = "post-adapter-fix"
})
-- #endregion

-- #region agent log - module return (tests H4)
agent_log("H4", "avante.lua module returning specs", {
  num_specs = 2,
  ai_bro_name = ai_bro[1],
  ai_bro_version = ai_bro.version,
  avante_name = avante[1],
  success = true
})
-- #endregion

return { avante, ai_bro }
