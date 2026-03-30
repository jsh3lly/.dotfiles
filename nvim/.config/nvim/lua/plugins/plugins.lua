return {

    ------------------------------------------------
    --                 Appearance                 --
    ------------------------------------------------

    -- colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },
        },
        config = function(_, opts)
            -- This line is what tells Rose Pine to use your styles!
            require("rose-pine").setup(opts)

            -- Now we can safely load the colorscheme
            vim.cmd("colorscheme rose-pine")
        end,
    },

    -- breadcrumbs
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
            -- TODO: perhaps consider not having the path of the file??
        },
    },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                -- theme = 'tokyonight',
                -- theme = 'onedark',
                -- theme = 'catppuccin',
                theme = 'auto',
                transparent = true,
                globalstatus = true,
                --component_separators = { left = "¿", right = "¿" }, 
                --section_separators = { left = "¿", right = "¿" },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics', {"macro-recording",fmt = function ()
                    local recording_register = vim.fn.reg_recording()
                    if recording_register == "" then
                        return ""
                    else
                        return "Recording @" .. recording_register
                    end
                end}},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            tabline = {
                lualine_a = {'buffers'},
                lualine_z = {'tabs'},
            },
        }
    },

    -- start screen
    {
        "mhinz/vim-startify",
        init = function ()
            vim.g.startify_session_sort = 1
        end
    },

    {
        "lewis6991/gitsigns.nvim",

        keys = {
            -- Stage / Undo / Reset
            { "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Current Hunk" },
            { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Hunk Stage" },
            { "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },

            -- Preview / Navigation
            { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
            { "<leader>hk", "<cmd>Gitsigns prev_hunk<CR>", desc = "Go to Previous Hunk" },
            { "<leader>hj", "<cmd>Gitsigns next_hunk<CR>", desc = "Go to Next Hunk" },

            -- Blame / Diffing
            { "<leader>hb", "<cmd>G blame<CR>", desc = "Git blame" },
            { "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff this" },
            { "<leader>hl", "<cmd>LocalDiffthis<CR>", desc = "Do Local diff here" },
        }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        "tamton-aquib/duck.nvim",
        keys = {
            {'<leader>dd', function() require("duck").hatch("🐈") end},
            {'<leader>dk', function() require("duck").cook() end}
        }
    },

    { "norcalli/nvim-colorizer.lua" },

    {
        "petertriho/nvim-scrollbar",
        dependencies = {{"kevinhwang91/nvim-hlslens"}},
        -- 1. We load it for all files so it's always ready!
        event = "BufReadPost",
        opts = {
            -- Handlers (Turn on visual indicators!)
            handlers = {
                cursor = false, -- Shows where your cursor is
                search = true, -- Highlights your active search results!
                diagnostic = true, -- Shows LSP errors/warnings in the bar!
                gitsigns = true, -- Shows added/removed lines from Git!
            },

            -- Aesthetics
            excluded_buftypes = {
                "terminal", -- Don't show it in terminals
                "nofile", -- Don't show it in empty buffers
            },
            excluded_filetypes = {
                "neo-tree", -- Keep it out of your Neo-Tree sidebar!
                "oil", -- Keep it out of your Oil file manager!
                "help",
            },
        },
    },

    {
        'kevinhwang91/nvim-ufo',
        dependencies = {'kevinhwang91/promise-async'},
        opts = {
            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = ('  ⚞^•⩊•^⚟  ... %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, {suffix, 'MoreMsg'})
                return newVirtText
            end,
            provider_selector = function()
                return {'treesitter', 'indent'}
            end
        }
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },

                -- themable = true,
                separator_style = "slant",

}
        }
    },

    ------------------------------------------------
    --                  Behavior                  --
    ------------------------------------------------

    -- enable the same keybind to navigate between tmux and nvim
    -- {
    --     "christoomey/vim-tmux-navigator",
    --     lazy = false, -- Load this immediately at startup
    --     init = function()
    --         -- Disable the default <C-h>, <C-j>, <C-k>, <C-l> mappings
    --         vim.g.tmux_navigator_no_mappings = 1
    --     end,
    --     config = function()
    --         -- Since we aren't using Lazy's `keys`, we map them directly in the config
    --         vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to pane on left" })
    --         vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to pane below" })
    --         vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to pane above" })
    --         vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to pane on right" })
    --         vim.keymap.set("n", "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Go to previous pane" })
    --     end,
    -- },

    -- auto-add brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- Which-Key handles your keymap visual menu
    {
        "folke/which-key.nvim",
        event = "VeryLazy", -- Loads quickly after UI starts
        opts = {
            -- Leave this empty for now to use default settings
        },
    },

    { "tpope/vim-surround" },
    {
        'smoka7/hop.nvim',
        version = "*",
        keys = {
            {"s", "<cmd>HopPatternAC<CR>", desc="Hop forward"},
            {"S", "<cmd>HopPatternBC<CR>", desc="Hop backward"},
        },
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "nvim-mini/mini.icons" },
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostic disable: missing-fields
        opts = {
            keymap = {
                builtin = {
                    -- We set [1] = true so it inherits fzf-lua's default keys, 
                    -- and then smoothly overrides Shift+J and Shift+K for you
                    true,
                    ["<S-j>"] = "preview-page-down",
                    ["<S-k>"] = "preview-page-up",
                },
            },
            winopts = {
                -- This forces the floating window to use sharp, square borders
                border = "single",

                preview = {
                    -- This ensures the interior preview window boundary matches!
                    border = "single",
                },
            },
            preview = {
                default = "bat"
            },
            files = {
                fd_opts = "--type f --hidden --follow -E .git -E .o -E .cache -E target/ --no-ignore-vcs",
            },
            diagnostics = {
                -- Forces fzf to keep the original file index order, 
                -- making the line you are currently on the focused one.
                fzf_opts = { ["--tiebreak"] = "index" },
            },
        },
        ---@diagnostic enable: missing-fields
        keys = {
            -- file releated
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
            { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Search Buffers" },
            { "<leader>fg", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep Current Buffer" },
            { "<leader>fG", "<cmd>FzfLua grep_project<cr>", desc = "Project Grep" },
            { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc="Show Document symbols"},
            { "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc="Show Workspace Symbols"},
            { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
            { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Search Help" },

            -- LSP related
            { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Get References" },
            { "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Get implementations" },
            { "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Get/jump to definitions" },
            { "gD", "<cmd>FzfLua lsp_declarations<CR>", desc = "Get/jump to declarations" },

            {"<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", desc="Rename"},

            -- Misc
            { "<M-cr>", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Code Actions" },
            { "gh", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch between header and source file (C/C++)" },
            { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Show Keymaps" },


            -- Diagnostics
            { "<leader>q", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", desc = "Get Workspace Diagnostics" },
        },
    },

    { "tpope/vim-fugitive" },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        event = { "BufReadPost", "BufNewFile" },
        build = ':TSUpdate',
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = {
            autotag = {
                enable = true,
            },
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = false,
                disable = {},
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            ensure_installed = {'regex', 'toml', 'comment', 'tsx', 'luadoc', 'python', 'vimdoc', 'yaml', 'bash', 'lua', 'c', 'luap', 'html', 'julia', 'javascript', 'commonlisp', 'rust', 'markdown', 'typescript', 'query', 'vim', 'markdown_inline', 'json', 'java', 'cpp', 'gdscript', 'godot_resource', 'gdshader'},
            rainbow = {
                enable = false,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
            },

            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- Functions
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        -- Classes / Structs
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        -- Loops (For, While, etc.)
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- Conditionals (If, Else, Switch)
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = true,
                },

                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]"] = "@function.outer",
                        ["]]"] = { query = "@class.outer", desc = "next class start" },
                    },
                    goto_next_end = {
                        ["]m"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["["] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[m"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
            multiline_threshold = 3, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context lines to discard if max_lines is exceeded

            -- Use sharp borders to match your fzf-lua aesthetic!
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            separator = nil, -- No line separator below the context
        },
    },
    { "andweeb/presence.nvim" },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            size = 7,
            open_mapping = [[<M-`>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '3',
            start_in_insert = true,
            persist_size = true,
            direction = 'float',
            auto_scroll = true,
            float_opts = {
                border = 'curved',
                winblend = 10,
            }
        },
        keys = {
            { [[<M-`>]], "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
        },
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "⚡️", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "❕", color = "hint", alt = { "INFO", "IMP", "FEATURE"} },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
        },
        keys = {
            {"<leader>td", "<cmd>TodoLocList<cr>", desc="Show project TODOs"},
        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },

        -- This handles your <C-e> toggle globally so you can open it from code files!
        keys = {
            { "<C-e>", "<cmd>Neotree toggle left<CR>", desc = "Toggle Neo-Tree Sidebar" },
        },

        opts = {
            close_if_last_window = true,

            window = {
                width = 30, -- Classic sidebar width
                mappings = {
                    -- 1. YOUR EXACT OVERRIDES GO HERE!
                    ["<C-h>"] = "navigate_up",    -- 'Dir Up' (change_root_to_parent)
                    ["<C-l>"] = "open",           -- 'Dir In' (change_root_to_node or opens file)
                    ["?"]     = "show_help",      -- 'Help' (toggle_help)
                    ["<C-e>"] = "close_window",   -- 'Tree Close' (toggles off when focused)
                    ["<S-CR>"] = "open_vsplit",    -- 'Open in vsplit' (node.open.vertical)
                    ["f"]     = "fuzzy_finder",   -- 'Live Filter' (live_filter.start)
                },
            },

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_current",
            },
        },
    },

    {
        "bullets-vim/bullets.vim",
        init = function()
            -- This disables the automatic promotion/cycling mechanic!
            vim.g.bullets_bullet_types = { '-' }
            vim.g.bullets_delete_last_bullet_if_empty = 1
        end,
        -- 2. This ensures it loads for markdown and text files
        ft = { "markdown", "text", "gitcommit" },
    },

    -- IMP: Soji demo
    {
        "farmergreg/vim-lastplace",
        init = function ()
            vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
            vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
        end
    },

    { "tpope/vim-repeat" },

    { "alvan/vim-closetag" },

    { "alec-gibson/nvim-tetris" },

    {
        'Wansmer/treesj',
        keys = {
            '<space>m',
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
        opts = {} -- this is to force Lazy to call its setup function
    },
    {
        "vim-scripts/DoxygenToolkit.vim",
        lazy = true,
        cmd = { "Dox", "DoxAuthor" }, -- Only loads when you execute the Doxygen commands
    },
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false, -- Needs to be loaded immediately for global keymaps
        config = function()
            local ss = require("smart-splits")

            -- Optional: You can customize the behavior here!
            ss.setup({
                -- Ignored filetypes or buffer types (good for Neo-Tree)
                ignored_filetypes = { 'nofile', 'quickfix', 'prompt' },
            })

            ----------------------------------------------------
            -- 1. Navigation (Your old Tmux Navigator binds) --
            ----------------------------------------------------
            vim.keymap.set("n", "<M-h>", ss.move_cursor_left, { desc = "Go to pane on left" })
            vim.keymap.set("n", "<M-j>", ss.move_cursor_down, { desc = "Go to pane below" })
            vim.keymap.set("n", "<M-k>", ss.move_cursor_up, { desc = "Go to pane above" })
            vim.keymap.set("n", "<M-l>", ss.move_cursor_right, { desc = "Go to pane on right" })

            -- Smart-splits doesn't have a direct "previous pane" hook, 
            -- but this is the standard native Neovim equivalent for it!
            vim.keymap.set("n", "<M-\\>", "<cmd>wincmd p<cr>", { desc = "Go to previous pane" })

            ----------------------------------------------------
            -- 2. Resizing (Your Shift + Arrow binds)       --
            ----------------------------------------------------
            -- Left/Right resizes (Vertical splits)
            vim.keymap.set("n", "<S-Right>", function() ss.resize_right(4) end, { desc = "Increase vertical split resize" })
            vim.keymap.set("n", "<S-Left>", function() ss.resize_left(4) end, { desc = "Decrease vertical split resize" })

            -- Up/Down resizes (Horizontal splits)
            vim.keymap.set("n", "<S-Up>", function() ss.resize_up(2) end, { desc = "Decrease horizontal split resize" })
            vim.keymap.set("n", "<S-Down>", function() ss.resize_down(2) end, { desc = "Increase horizontal split resize" })
        end,
    },

    {
        "dhruvasagar/vim-zoom",
        -- This tells LazyVim to only load the plugin when you press the key!
        keys = {
            { "<C-CR>", "<cmd>call zoom#toggle()<CR>", mode = "n", desc = "Zoom current pane" },
        },
    },

    {
        "lewis6991/hover.nvim",
        event = "VeryLazy", -- Optimizes startup by loading in the background
        keys = {
            { "<C-q>", function() require("hover").hover() end, mode = "n", desc = "Show Documentation" },
            { "<C-S-q>", function() require("hover").enter() end, mode = "n", desc = "Enter Documentation" },
        },
        config =  {
            providers = {
                'hover.providers.lsp',
                'hover.providers.man',
                'hover.providers.diagnostic',
                'hover.providers.dictionary',
                'hover.providers.fold_preview',
                'hover.providers.gh',
                'hover.providers.gh_user',
                'hover.providers.dap',
                'hover.providers.jira',
            },
            -- preview_opts = {
            --     border = nil -- Kept your preferred border style
            -- },
            -- preview_window = false,
            -- title = true
        }
    }
}
