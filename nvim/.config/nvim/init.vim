" TODO: implement softwrap j,k goes to the next visual line (in the softwrap
" TODO: Come up with a better way to manage themes
" TODO: Properly setup mason.nvim
" TODO: whichkey disable for 'c', 'd', etc
" TODO: Make Noice retain messages for longer
" TODO: Get ideavimrc from Omen
" TODO: convert config to lua
" NOTE: Plug plugins are located in /home/jshelly/.local/share/nvim/plugged
" TODO: maybe have a key holding key bind for CursorHold??



" Deps: pynvim, plug, fd
" ========== Installing Some Plugins ==========
call plug#begin()
" Plug 'kamykn/spelunker.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'SmiteshP/nvim-navic'
Plug 'utilyre/barbecue.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-surround'
Plug 'phaazon/hop.nvim' " Easy motion type plugin
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-lua/plenary.nvim' " Dependency for above
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'dylon/vim-antlr'
" Plug 'preservim/nerdtree' |
" 			\ Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive' " ex: :G diff HEAD~ to see last commit changes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'numToStr/Comment.nvim'
Plug 'andweeb/presence.nvim'
Plug 'dhruvasagar/vim-zoom'
Plug 'wesQ3/vim-windowswap'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'onsails/lspkind.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'windwp/nvim-autopairs'
Plug 'farmergreg/vim-lastplace'
Plug 'p00f/clangd_extensions.nvim'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'vimwiki/vimwiki'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tamton-aquib/duck.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'mrjones2014/legendary.nvim'
Plug 'folke/which-key.nvim'
Plug 'williamboman/mason.nvim'
Plug 'MunifTanjim/nui.nvim'
" Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'lewis6991/hover.nvim'
Plug 'alec-gibson/nvim-tetris'
Plug 'tpope/vim-repeat'
Plug 'p00f/nvim-ts-rainbow'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'alvan/vim-closetag'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'navarasu/onedark.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'ku1ik/vim-pasta' " auto indent on paste!
Plug 'petertriho/nvim-scrollbar'
Plug 'ku1ik/vim-pasta' " auto indent on paste!
Plug 'christoomey/vim-tmux-navigator'
Plug 'rose-pine/neovim'
" Plug 'romgrk/barbar.nvim'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
" ========== Setting opts for gui frontend(s) ==========
" Neovide:
if exists("g:neovide")
    set guifont=JetbrainsMonoNL\ Nerd\ Font:h7
    " let g:neovide_transparency = 0.8
    let g:neovide_confirm_quit = v:true
    let g:neovide_cursor_vfx_mode = "pixiedust"
    let g:neovide_cursor_vfx_particle_lifetime = 2.0
    let g:neovide_cursor_vfx_particle_density = 100.0
endif


" ========== Setting some general opts for neovim ==========
let g:tmux_navigator_no_mappings = 1
filetype on
" autocmd BufReadPre,FileReadPre *.txt,*.md setlocal spell spelllang=en_us
set spell spelllang=en_us

" au  *.g set filetype=antlr3
set termguicolors
lua require'colorizer'.setup()
set nu rnu          " Hybrid line numbers
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " convert tabs to spaces
set scrolloff=7
set clipboard+=unnamedplus " global clipboard used
set undofile
set undodir=~/.nvim-undodir
set undoreload=10000
set incsearch
set gdefault "useful for global subst in %s/abc/xyz
let mapleader = " "

" Text wrapping
" set nowrap
set linebreak
set showbreak=↪\ 
set listchars=extends:>,precedes:<

" Mouse support
set mouse=a
set ignorecase
set smartcase
set backspace=indent,eol,start

" File associations
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
" au BufRead,BufNewFile *.txt set filetype=markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.in set filetype=javascript
au BufRead,BufNewFile *.out set filetype=javascript

"=============== Setting some general keybindings for neovim ===============
" Make p do pasting with indentation in mind
nnoremap p ]p
" unmapping ctrl + f; s-j
map <C-F> <Nop>
" map <S-j> <Nop>

" insert mode shift tabbing now dedents (tabbing already indents)
inoremap <S-Tab> <C-d>

" Pressing Enter now will unhighlight old search results
nnoremap <silent><CR> :noh<CR><CR>
" IF no lsp, then this should work. This is just a substitute
nnoremap <leader><F2> :%s/\<<C-r><C-w>\>/

"=============== Panes and buffer stuff =============== 
"Next buffer
"Previous buffer
" lua vim.keymap.set('n', '<leader>k', ":bprevious<CR>", {desc = "hello"})
" Switch from terminal mode to normal mode
tnoremap <Esc> <C-\><C-n>
" --- Navigate panes ---

" tnoremap <C-Up> <ESC><C-W>k
" tnoremap <C-Down> <ESC><C-W>j
" tnoremap <C-Left> <ESC><C-W>h
" tnoremap <C-Right> <ESC><C-W>l

" select all text
nmap <C-a> ggVG

" move updown by visual (wrapped) lines
noremap j gj
noremap k gk

" mapping '#' to start of line
nnoremap # ^

"=============== Setting up plugins (and thier keybinds)===============

" Setup for tokyonight (Theme)
lua << EOF
-- tokyonight = require("tokyonight").setup({
--     on_colors = function(colors)
--         colors.border = "#565f89"
--     end
-- })
--
-- vim.cmd([[colorscheme tokyonight-moon]])
-- require('barbecue').setup {
-- theme = 'tokyonight',
-- }

-- Lua
-- require('onedark').setup {
--     style = 'warmer',
--     transparent = false,
--
--     lualine = {
--         transparent = true,
--     },
-- }
-- require('onedark').load()
-- require('barbecue').setup {
-- theme = 'onedark',
-- }

-- require("catppuccin").setup({
-- color_overrides = {
--     all = {
--         crust = "#565f89",
--         },
--     },
-- integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     notify = true,
--     mason = true,
--     noice = true,
--     which_key =true,
-- }
-- })
-- vim.cmd.colorscheme "catppuccin-mocha"
EOF
" source ~/.config/nvim/setup_tokyonight.vim
" nnoremap <leader>i :call Tokyonight_transparency_switcher()<CR>:colorscheme tokyonight-night<CR>

lua << EOF

-- Web Devicons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- When creating a blankline (say using 'o'), indent it properly
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
}
-- Lualine
local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

require('lualine').setup {
    options = {
        -- theme = 'tokyonight',
        theme = 'onedark',
        -- theme = 'catppuccin',
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics', {"macro-recording",fmt = show_macro_recording}},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    -- tabline = {
    --     lualine_a = {'buffers'},
    --     lualine_z = {'tabs'},
    -- },
}

-- TODO: Set up vim surround (?)

require'hop'.setup()
EOF

" Setup for vim-visual-multi
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]             = '<M-j>'
let g:VM_maps["Add Cursor Up"]               = '<M-k>'
let g:VM_maps['Find Under']                  = ''
let g:VM_maps['Find Subword Under']          = ''

" Setup for copilot
" imap <silent><script><expr> <F1> copilot#Accept("\<CR>")
" let g:copilot_node_command = "~/.nvm/versions/node/v16.20.0/bin/node"
" let g:copilot_no_tab_map = v:true

" Setup for Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
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
    ensure_installed = {'regex', 'toml', 'comment', 'tsx', 'luadoc', 'python', 'vimdoc', 'yaml', 'bash', 'lua', 'c', 'luap', 'html', 'julia', 'javascript', 'commonlisp', 'rust', 'markdown', 'typescript', 'query', 'vim', 'markdown_inline', 'json', 'java', 'cpp'},
    -- highlight = {
    --     -- ...
    -- },
    -- ...
    rainbow = {
        enable = false,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  
 move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["["] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

require('Comment').setup()

-- TODO: 
require('presence'):setup()

-- Window swap
vim.cmd([[
let g:windowswap_map_keys = 0
]])

require("todo-comments").setup {
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
}

-- sus
vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("ඞ") end, {})
vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})

EOF

" imap <C-BS> <C-W>
"  --- Other Config ---
" let g:dracula_colorterm = 0
" let g:dracula_high_contrast_diff = 1

let g:context_enabled = 1
" unzoom
" set statusline+=%{zoom#statusline()}



" --- nvim.cmp & LSP Config ---
set completeopt=menu,menuone,noselect
" vim popupmenu stuff
" highlight NormalFloat guibg=NONE
" highlight FloatBorder guibg=NONE

lua << EOF
require("nvim-autopairs").setup {}
local nvim_lsp = require('lspconfig')
local lspkind = require('lspkind')
local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- IMP: Using fzflua for the above 4 commands ^^
  -- buf_set_keymap('n', '<C-q>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts) -- IMP: Using hover.nvim for this
  -- buf_set_keymap('n', '', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- -- buf_set_keymap('n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- IMP: Using code actions plugin for this
  -- buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  -- buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

local cmp = require'cmp'
cmp.setup({
formatting = {
fields = {'abbr', 'kind'}, -- removes "menu"
format = lspkind.cmp_format({
  mode = 'symbol', -- show only symbol annotations
  maxwidth = 25, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

  -- The function below will be called before any actual modifications from lspkind
  -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
  before = function (entry, vim_item)
    vim_item.menu = "" -- This disables the "macro_rules!" etc text in Rust
    return vim_item
  end

})
},
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
  vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
['<C-k>'] = cmp.mapping.select_prev_item(),
['<C-j>'] = cmp.mapping.select_next_item(),
['<S-j>'] = cmp.mapping.scroll_docs(4),
['<S-k>'] = cmp.mapping.scroll_docs(-4),

-- ['<C-Space>'] = cmp.mapping.complete(),
['<C-c>'] = cmp.mapping.close(),
['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
  -- { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
},
{

  { name = 'buffer' },
  { path = 'path'}
}),

sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
-- sources = cmp.config.sources({
--   { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
-- }, {
--   { name = 'buffer' },
-- })
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = {
--   { name = 'buffer' }
-- }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = cmp.config.sources({
--   { name = 'path' }
-- }, {
--   { name = 'cmdline' }
-- })
-- })

-- Set up lspconfig.

-- vim-language-server, sumneko/lua-language-server
-- you may find additional lsps and how to configure them by doing :help lspconfig-all
local servers = { "pyright", "vimls", "marksman",  "hls", "html", "cssls", "tsserver", "bashls", "rust_analyzer", "clangd", "misspell"} -- excluded ones: "marksman".  
-- Implicitly activated: "clangd" (via clangd_extensions), "rust_analyzer" (via rust-tools), lua-language-server (via lua-ls), 
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Set up clangd_extensions: This automatically loads clangd and adds some extensions to it.
require("clangd_extensions").setup({
    inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
    },
    ast = {
        -- These are unicode, should be available in any font
        role_icons = {
            type = "🄣",
            declaration = "🄓",
            expression = "🄔",
            statement = ";",
            specifier = "🄢",
            ["template argument"] = "🆃",
        },
        kind_icons = {
            Compound = "🄲",
            Recovery = "🅁",
            TranslationUnit = "🅄",
            PackExpansion = "🄿",
            TemplateTypeParm = "🅃",
            TemplateTemplateParm = "🅃",
            TemplateParamObject = "🅃",
        },
        --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            }, ]]

        highlights = {
            detail = "Comment",
        },
    },
    memory_usage = {
        border = "none",
    },
    symbol_info = {
        border = "none",
    },
})

-- local rt = require("rust-tools")
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-q>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- -- Signature help
--       -- vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
--       -- -- rename
--       -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
--     end,
--   },
-- })
-- rt.inlay_hints.enable()

require'lspconfig'.lua_ls.setup {
settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
},
}

require'lspconfig'.csharp_ls.setup{

}

-- require'lspconfig'.rust_analyzer.setup{
-- settings = {
--   ['rust-analyzer'] = {
--     diagnostics = {
--       enable = true,
--     },
--   },
-- },
-- }

EOF

let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Toggle Term
lua << EOF
require("toggleterm").setup{
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
}

EOF
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true



local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-h>',      api.tree.change_root_to_parent,     opts('Dir Up'))
  vim.keymap.set('n', '<C-l>',      api.tree.change_root_to_node,       opts('Dir In'))
  vim.keymap.set('n', '?',          api.tree.toggle_help,               opts('Help'))
  vim.keymap.set('n', '<C-e>',      api.tree.toggle,                    opts('Tree Open'))
  vim.keymap.set('n', '<S-CR>',     api.node.open.vertical,             opts('Open in vsplit'))
  vim.keymap.set('n', 'f',          api.live_filter.start,              opts('Live Filter'))
end

require("nvim-tree").setup({
on_attach = my_on_attach,
disable_netrw       = true,
hijack_netrw = true,
hijack_cursor = true,
sync_root_with_cwd = true,
sort_by = "case_sensitive",
filters = {
    dotfiles = false,

    custom = { '^.git$' }
},
git = {
    ignore = false,
},
view = {
    preserve_window_proportions = true,
    side = "left",
    centralize_selection = false, -- default false
    number = true,
    relativenumber = true,
    width = 30,
    float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
            relative = "editor",
            border = "shadow",
            height = 1200,
            row = 0,
            col = 0,
        },
    },
    -- mappings = {
    --     list = {
    --         {key = "-", action = ""},
    --         { key = "f",                              action = "live_filter" },
    --         { key = "<C-q>",                          action = "toggle_file_info" },
    --         -- { key = "<S-CR>",                         action = "cd"},
    --         { key = "?",                              action = "toggle_help" },
    --         { key = "<S-CR>",                         action = "vsplit"}
    --     },
    -- },
},
renderer = {
    group_empty = true,
},
filters = {
    dotfiles = true,
},
})
--
require'fzf-lua'.setup {
    preiview = {
        default = 'bat',
        },
    keymap = {
        builtin = {
            ["<S-J>"] = "preview-page-down",
            ["<S-K>"] = "preview-page-up",
            }
        },
    files = {
        fd_opts = "--type f --hidden --follow -E .git -E .o -E .cache -E target/ --no-ignore-vcs",
        },
    }

-- Java LSP setup

-- For data directory (current workspace)
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/home/jshelly/.config/nvim/eclipse-project-data' .. project_name
--
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--
--     -- 💀
--     'java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xms1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--     -- 💀
--     '-jar', '/home/jshelly/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--     '-configuration', '/home/jshelly/.local/share/nvim/mason/packages/jdtls/config_linux',
--     '-data', workspace_dir,
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--     }
--   }
-- }
-- -- This starts a new client & server,
-- -- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)

EOF

" nmap <leader>p :FzfLua files<CR>
" nmap <leader>[ :FzfLua buffers<CR>
" nmap <leader>] :FzfLua lsp_workspace_symbols<CR>
" nmap <leader>\p :FzfLua grep_project<CR>
" nmap <leader>\c :FzfLua grep_curbuf<CR>
" nmap <F3> :FzfLua lsp_document_symbols<CR>

" nmap gr :FzfLua lsp_references<CR>
" nmap gi :FzfLua lsp_implementations<CR>
" nmap gd :FzfLua lsp_definitions jump_to_single_result=true<CR>
" nmap gD :FzfLua lsp_declarations jump_to_single_result=true<CR>
" nmap <leader>q :FzfLua lsp_workspace_diagnostics<CR>

" <CR>/<tab> edit file by choosing split
" <C-v> edit file by choosing vertical split
" <C-x> edit file by choosing horizontal split
" f search
" a add file
" d remove
" W collapse all
" E expand all


" Git signs
lua require('gitsigns').setup()
" nnoremap <leader>hs :Gitsigns stage_hunk<CR>
" nnoremap <leader>hu :Gitsigns undo_stage_hunk<CR>
" nnoremap <leader>hr :Gitsigns reset_hunk<CR>
" nnoremap <leader>hp :Gitsigns preview_hunk<CR>
" nnoremap <leader>hk :Gitsigns prev_hunk<CR>
" nnoremap <leader>hj :Gitsigns next_hunk<CR>
" nnoremap <leader>hb :G blame<CR>
" vnoremap <leader>hd :Gitsigns diffthis<CR>
" nnoremap <leader>hd :Gitsigns diffthis<CR>
" nnoremap <leader>ld :LocalDiffthis<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! LocalDiffthis call s:DiffWithSaved()
set list listchars=tab:▸\ ,trail:·,nbsp:␣


lua << EOF

require("hover").setup {
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        require('hover.providers.gh')
        require('hover.providers.gh_user')
        require('hover.providers.jira')
        require('hover.providers.man')
        require('hover.providers.dictionary')
    end,
    preview_opts = {
        border = nil
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true
}


-- Setup keymaps
-- vim.keymap.set("n", "<C-q>", require("hover").hover, {desc = "hover.nvim"})


vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local handler = function(virtText, lnum, endLnum, width, truncate)
local newVirtText = {}
local suffix = (' ... %d '):format(endLnum - lnum)
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
end

require('ufo').setup({
fold_virt_text_handler = handler,
provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
end
})

require("bufferline").setup({
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
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),

}
})

-- which-key setup
vim.o.timeout = true
vim.o.timeoutlen = 500
require('legendary').setup({ which_key = { auto_register = true } })
local wk = require("which-key")
wk.setup()
wk.register({
-- Panes
["<M-j>"] = {":TmuxNavigateDown<CR>", "Go to pane below"},
["<M-k>"] = {":TmuxNavigateUp<CR>", "Go to pane above"},
["<M-l>"] = {":TmuxNavigateRight<CR>", "Go to pane on right"},
["<M-h>"] = {":TmuxNavigateLeft<CR>", "Go to pane on left"},
-- ["<C-J>"] = {"<C-W>j", "Go to pane below"},
-- ["<C-K>"] = {"<C-W>k", "Go to pane above"},
-- ["<C-L>"] = {"<C-W>l", "Go to pane on right"},
-- ["<C-H>"] = {"<C-W>h", "Go to pane on left"},
["<S-Right>"] = { "<cmd>vertical resize +7<CR>", "Increase vertical split resize"},

["<S-Left>"] = { "<cmd>vertical resize -7<CR>", "Decrease vertical split resize"},
["<S-Up>"] = { "<cmd>resize -2<CR>", "Increase horizontal split resize"},
["<S-Down>"] = { "<cmd>resize +2<CR>", "Decrease horizontal split resize"},

-- Tabs
["<C-Tab>"] = {"<cmd>tabnext<cr>", "Go to next tab"},
["<C-S-Tab>"] = {"<cmd>tabprevious<cr>", "Go to previous tab"},

-- leader key-binds
["<leader>"] = {
    -- Panes
    ["1"] = {"1<c-w>w", "Go to pane 1"},
    ["2"] = {"2<c-w>w", "Go to pane 2"},
    ["3"] = {"3<c-w>w", "Go to pane 3"},
    ["4"] = {"4<c-w>w", "Go to pane 4"},
    ["5"] = {"5<c-w>w", "Go to pane 5"},
    ["6"] = {"6<c-w>w", "Go to pane 6"},
    ["7"] = {"7<c-w>w", "Go to pane 7"},
    ["8"] = {"8<c-w>w", "Go to pane 8"},
    -- s = {"<cmd>call WindowSwap#EasyWindowSwap()<CR>", "Swap position of two panes"},
    s = {
        a = {"zg", "Add word to spell list"},
        j = {"]s", "Go to next spelling error"},
        k = {"[s", "Go to prev spelling error"},
        t = {"<cmd>setlocal spell! spelllang=en_us<CR><cmd>", "Turn spell checker on/off"},
        s = {":WhichKey z=<CR>", "Get suggestions"}
        },
    -- Buffers
    j = {"<cmd>bnext<cr>", "Go to next buffer"},
    k = {"<cmd>bprevious<cr>", "Go to previous buffer"},
    -- Tabs
    -- ["<Tab>"] = {"<cmd>tabnext<cr>", "Go to next tab"},
    -- ["<S-Tab>"] = {"<cmd>tabprevious<cr>", "Go to previous tab"},

    -- Todos
    -- vim.cmd("nmap <silent> <leader>td :TodoTelescope<CR>")
    t = {
        name = "Tabs/TODOs",
        n = {"<cmd>tabnew<CR>", "Creaate new tab"},
        x = {"<cmd>tabclose<CR>", "Close the tab"},
        j = {"<cmd>tabnext<cr>", "Go to next tab"},
        k = {"<cmd>tabprevious<cr>", "Go to previous tab"},
        d = {"<cmd>TodoLocList<cr>", "Show project TODOs"},
    },

    ["<Right>"] = {"<cmd>BufferLineMoveNext<CR>", "Move current buffer forward"},
    ["<Left>"] = {"<cmd>BufferLineMovePrev<CR>", "Move current buffer backward"},

    -- Fzflua
    f = {
        name = "FzfLua actions...",
        f = {"<cmd>FzfLua files<CR>", "Show files list"},
        b = {"<cmd>FzfLua buffers<CR>", "Show opened buffers list"},
        ["["] = {"<cmd>FzfLua grep_curbuf<CR>", "Grep current buffer"},
        ["]"] = {"<cmd>FzfLua grep_project<CR>", "Grep project"},
        s = {"<cmd>FzfLua lsp_document_symbols<CR>", "Show Document symbols"},
    },

    -- Git signs
    h = {
        name = "Git signs commands",
        s = {"<cmd>Gitsigns stage_hunk<CR>", "Stage Current Hunk"},
        u = {"<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Hunk Stage"},
        r = {"<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk"},
        p = {"<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk"},
        k = {"<cmd>Gitsigns prev_hunk<CR>", "Go to Previous Hunk"},
        j = {"<cmd>Gitsigns next_hunk<CR>","Go to Next Hunk"},
        b = {"<cmd>G blame<CR>", "Git blame"},
        d = {"<cmd>Gitsigns diffthis<CR>", "Diff this"},
        -- d = {"<cmd>Gitsigns diffthis<CR>", }, -- TODO: Make visual map
        l = {"<cmd>LocalDiffthis<CR>", "Do Local diff here"},
        },
        q = {"<cmd>FzfLua lsp_workspace_diagnostics<CR>", "Get Workspace Diagnostics"},
    },

["<F3>"] = {"<cmd>FzfLua lsp_live_workspace_symbols<CR>", "Show Workspace Symbols"},
-- nvim extra motions
['s'] = {"<cmd>HopPatternAC<CR>", "Hop forward"},
['S'] = {"<cmd>HopPatternBC<CR>", "Hop backward"},
['<S-j>'] = {"<cmd>m+<cr>", "Move current line down"},
['<S-k>'] = {"<cmd>m-2<cr>", "Move current line up"},

-- nnoremap <A-j> :m .+1<CR>==
-- nnoremap <A-k> :m .-2<CR>==
-- inoremap <A-j> <Esc>:m .+1<CR>==gi
-- inoremap <A-k> <Esc>:m .-2<CR>==gi
-- vnoremap <A-j> :m '>+1<CR>gv=gv
-- vnoremap <A-k> :m '<-2<CR>gv=gv

-- Comment and uncomment (_ referes to /)
["<C-_>"] = {"gcc", "(Un)comment line", noremap=false},
-- ["<C-_>"] = {"gc", "(Un)comment line", noremap=false, mode="v"},

-- Zoom current pane
["<C-CR>"] = {"<Plug>(zoom-toggle)", "Zoom current pane"},

-- LSP stuff
["<M-CR>"] = {"<cmd>CodeActionMenu<CR>", "Open Code Action Menu"},
-- ["<M-CR>"] = {"<C-o><cmd>CodeActionMenu<CR>"} INSERT MODE
-- ["<M-CR>"] = {"<C-o><cmd>CodeActionMenu<CR>"} VISUAL MODE

 -- ["<S-j>"] = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Get Type signature"},
 ["<F2>"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename..."},

 g = {
    name = "Basic LSP commands...",
    r = {"<cmd>FzfLua lsp_references<CR>", "Get References"},
    i = {"<cmd>FzfLua lsp_implementations<CR>", "Get implementations"},
    d = {"<cmd>FzfLua lsp_definitions jump_to_single_result=true<CR>", "Get/jump to definitions"},
    D = {"<cmd>FzfLua lsp_declarations jump_to_single_result=true<CR>", "Get/jump to declarations"},
    h = {"<cmd>ClangdSwitchSourceHeader<cr>", "Switch between header and source file (C/C++)"},
 },

 -- MISC
["<C-S>"] = {"<cmd>SSave<CR>", "Save project..."},
["<C-E>"] = {"<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree"},
["<C-Q>"] = {require("hover").hover, "Show Documentation"},

["zR"] = {require('ufo').openAllFolds, "Open All Folds"},
["zM"] = {require('ufo').closeAllFolds, "Close All Folds"},
})


-- Mason.nvim setup
require("mason").setup()

-- noice.nvim setup
-- require("notify").setup({
--     fps= 60,
--     max_width = 70,
--     max_height=100,
-- })
require("noice").setup({
lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
        },
})


require("icon-picker").setup({
    disable_legacy_commands = true
})

require("scrollbar").setup({
handlers = {
    cursor = false,
}
})
EOF


lua << EOF
require("rose-pine").setup({
    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})

EOF
colorscheme rose-pine-moon
