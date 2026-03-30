local map = vim.keymap.set

-- ============================================================================
--  Panes and Tabs (Normal Mode)
-- ============================================================================
map("n", "<C-Tab>", "<cmd>tabnext<cr>", { desc = "Go to next tab", silent = true })
map("n", "<C-S-Tab>", "<cmd>tabprevious<cr>", { desc = "Go to previous tab", silent = true })

-- ============================================================================
-- Leader Keybinds (<leader>...)
-- ============================================================================

-- Speller Submenu (<leader>s...)
map("n", "<leader>sa", "zg", { desc = "Add word to spell list" })
map("n", "<leader>sj", "]s", { desc = "Go to next spelling error" })
map("n", "<leader>sk", "[s", { desc = "Go to prev spelling error" })
map("n", "<leader>st", "<cmd>setlocal spell! spelllang=en_us<CR>", { desc = "Turn spell checker on/off" })
map("n", "<leader>ss", "z=", { desc = "Get suggestions" })

-- Buffers (<leader>j and <leader>k)
map("n", "<leader>j", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>k", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })

-- Tabs/TODOs Submenu (<leader>t...)
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Create new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close the tab" })
map("n", "<leader>tj", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
map("n", "<leader>tk", "<cmd>tabprevious<cr>", { desc = "Go to previous tab" })

-- ============================================================================
--  Extra Motions & Functionalities
-- ============================================================================

-- Move lines up and down (Shift + j/k)
map("n", "<S-j>", "<cmd>m+<cr>", { desc = "Move current line down" })
map("n", "<S-k>", "<cmd>m-2<cr>", { desc = "Move current line up" })

-- Zoom current pane (Requires your zoom plugin to be installed!)
map("n", "<C-CR>", "<cmd>call zoom#toggle()<CR>", { desc = "Zoom current pane" })

-- MISC & Plugins
map("n", "<C-S>", "<cmd>SSave<CR>", { desc = "Save project..." })
map("n", "<C-E>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- UFO Folding (Code folding plugin)
map("n", "zR", function() require('ufo').openAllFolds() end, { desc = "Open All Folds" })
map("n", "zM", function() require('ufo').closeAllFolds() end, { desc = "Close All Folds" })

-- Re-indent automatically on paste
map({ "n", "v" }, "p", "p`[=`]", { desc = "Paste and auto-indent" })
map({ "n", "v" }, "P", "P`[=`]", { desc = "Paste and auto-indent" })

-- insert mode shift tabbing now dedents (tabbing already indents)
map("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true, desc = "Dedent line" })

--  Pressing Enter clears search highlights
map("n", "<CR>", "<cmd>nohlsearch<CR><CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

--  Switch from terminal mode to normal mode
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Terminal normal mode" })

-- Mapping '#' to start of line
map("n", "#", "^", { noremap = true, silent = true, desc = "Jump to start of line" })
