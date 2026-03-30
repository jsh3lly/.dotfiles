-------------------------------------------------
--      Setting some common vim options        --
-------------------------------------------------

-- Leader key must be set before plugins are loaded
vim.g.mapleader = " "

local opt = vim.opt

-- UI & Appearance
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cmdheight = 0
opt.scrolloff = 7
opt.linebreak = true
opt.showbreak = "↪ "
opt.list = true
opt.listchars = {
    tab = "▸ ",
    trail = "·",
    nbsp = "␣",
    extends = ">",
    precedes = "<"
}

-- cleaner folds
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Behavior
opt.timeoutlen = 500

-- Search & Spell
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.spell = true
opt.spelllang = "en_us"

-- Persistent Undo
opt.undofile = true
opt.undodir = vim.fn.expand("~/.nvim-undodir")
opt.undoreload = 10000

-- Folding (Treesitter/UFO compatible)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Neovide settings
if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMonoNL Nerd Font:h12"
    -- vim.g.neovide_transparency = 0.8
    vim.g.neovide_confirm_quit = true
    -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
    -- vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
    -- vim.g.neovide_cursor_vfx_particle_density = 100.0
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "❌",
            [vim.diagnostic.severity.WARN]  = "⚠️",
            [vim.diagnostic.severity.HINT]  = "💡",
            [vim.diagnostic.severity.INFO]  = " ",
        },
    },
})

-- =================================================
-- make clipboard work seamlessly with tmux over ssh
-- =================================================
-- Use OSC 52 for clipboard over SSH/Tmux
if vim.env.SSH_TTY ~= nil then
    local function paste()
        return {
            vim.fn.split(vim.fn.getreg(""), "\n"),
            vim.fn.getregtype(""),
        }
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = paste,
            ["*"] = paste,
        },
    }
end

-- Sync Neovim's default yank/delete register with the system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Disabling netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
