----------------------------------------------------------------
--  This file will set up the LSP, competition, and snippets  --
----------------------------------------------------------------

return {
    -- This is a luals extension which suppresses unnecessary warnings
    -- in the neovim lua config.
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    -- This is the setup for the LSPs
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            {
                "Saghen/blink.cmp",
                dependencies = {
                    "xzbdmw/colorful-menu.nvim",
                    "L3MON4D3/LuaSnip", -- The recommended engine
                    "rafamadriz/friendly-snippets", -- Thousands of pre-made snippets
                    {
                        "onsails/lspkind.nvim",
                        opts = {
                            -- Options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                            mode = 'symbol_text',
                            preset = 'default',
                        },
                    }
                },
                opts = {
                    keymap = {
                        preset = "none",

                        -- Basic Menu Navigation
                        ["<C-k>"] = { "select_prev", "fallback" },
                        ["<C-j>"] = { "select_next", "fallback" },
                        ["<C-d>"] = {
                            function(cmp)
                                    return cmp.select_next({count = 5})
                            end,
                            "fallback"
                        },

                        ["<C-u>"] = {
                            function(cmp)
                                return cmp.select_prev({count = 5})
                            end,
                            "fallback"
                        },

                        -- Scrolling Documentation (Shift + j/k)
                        ["<S-j>"] = { "scroll_documentation_down", "fallback" },
                        ["<S-k>"] = { "scroll_documentation_up", "fallback" },

                        -- Closing and Confirming
                        ["<C-c>"] = { "hide", "fallback" },
                        ["<CR>"] = { "accept", "fallback" },

                        -- Snippet Navigation (Tabbing through variables)
                        ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
                        ["<S-Tab>"] = { "snippet_backward", "fallback" },

                        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' }
                    },
                    appearance = {
                        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                        -- Adjusts spacing to ensure icons are aligned
                        nerd_font_variant = 'mono'
                    },
                    snippets = { preset = "luasnip" },
                    sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                    },
                    -- TODO: Change to "prefer_rust_with_warning"
                    fuzzy = { implementation = "lua" },
                    completion = {
                        -- ghost_text = {
                        --     enabled = true,
                        -- },
                        documentation = {
                            auto_show = true,
                            auto_show_delay_ms = 100,
                        },
                        -- treesitter_highlighting = true,
                        -- TODO: Fix this
                        -- window = {
                        --     border = "rounded",
                        --     max_width = 80,
                        --     max_height = 30,
                        -- },
                        menu = {
                            draw = {
                                -- We don't need label_description now because label and label_description are already
                                -- combined together in label by colorful-menu.nvim.
                                columns = { { "kind_icon" }, { "label", gap = 1 } },
                                components = {
                                    label = {
                                        text = function(ctx)
                                            return require("colorful-menu").blink_components_text(ctx)
                                        end,
                                        highlight = function(ctx)
                                            return require("colorful-menu").blink_components_highlight(ctx)
                                        end,
                                    },
                                    kind_icon = {
                                        text = function(ctx)
                                            return require('lspkind').symbolic(ctx.kind, { mode = 'symbol' })
                                        end,
                                    },
                                },
                            },
                        },
                    }
                }
            },
            {
                'mrcjkb/rustaceanvim',
                version = '^8', -- Recommended to lock to major version
                lazy = false,   -- This plugin handles its own lazy loading by filetype
            },
            {
                "dchinmay2/clangd_extensions.nvim",
                lazy = true,
                ft = { "c", "cpp", "h" },
            }
        },
        config = function()

            -- Setup Mason to manage external binaries
            require("mason").setup()

            --  Define the servers you want Mason to install automatically
            local servers = {
                pyright = {},       -- Python
                clangd = {},        -- C/C++
                rust_analyzer = {}, -- Rust
                lua_ls = {          -- Lua (example of server-specific settings)
                    settings = {
                        Lua = {
                            diagnostics = { globals = { 'vim' } },
                            workspace = { checkThirdParty = false },
                        },
                    },
                },
            }

            -- Common Capabilities (usually for autocompletion)
            -- This tells the LSP what your client (Neovim) can handle
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Broadcast capabilities and attach servers
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local opts = servers[server_name] or {}
                        opts.capabilities = capabilities
                        -- We will handle keymaps in keymaps.lua later, so we 
                        -- don't define an on_attach function here yet.
                        lspconfig[server_name].setup(opts)
                    end,
                },
            })
        end,
    },
}
