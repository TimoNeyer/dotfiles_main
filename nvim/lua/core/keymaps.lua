--
-- NeoVim Keybindings
--

--
-- Convention:
--  leader + d -> diagnostics
--  leader + <tab> -> tabs
--  leader + w -> window
--  leader + l -> linter
--  leader + s -> system
--

local opt = { noremap = true, silent = true }
local terminal = "term://zsh"

--
-- Handy helper stuff
--

-- Set Esc to remove highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", opt)

-- Enter command mode
vim.keymap.set("n", "<leader>c", ":", opt)

-- Set save and quit with Control
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opt)
vim.keymap.set("n", "<C-q>", "<cmd>wq<CR>", opt)

-- Do not yank when deleting single char
vim.keymap.set("n", "x", '"_x', opt)

-- Improve searching in buffer
vim.keymap.set("n", "n", "nzzzv", opt)
vim.keymap.set("n", "N", "Nzzzv", opt)

-- Improve vertival scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", opt)
vim.keymap.set("n", "<C-u>", "<C-d>zz", opt)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>tlw", "<cmd>set wrap!<CR>", opt)

-- Set jj to escape
vim.keymap.set("i", "jj", "<Esc>", opt)

-- Set overwrite to leader
vim.keymap.set("n", "<leader>w", ":w", opt)
vim.keymap.set("n", "<leader>ww", ":w<CR>", opt)
vim.keymap.set("n", "<leader>q", ":q<CR>", opt)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opt)
vim.keymap.set("n", "<leader>e", ":e", opt)

-- Easier exit
vim.keymap.set("n", "<leader>sq", ":wqa<CR>", opt)
vim.keymap.set("n", "<leader>sQ", ":qa<CR>", opt)

-- Toggle vertical column
vim.keymap.set("n", "<leader>scv", "<cmd> set cursorcolumn!<CR>", opt)
vim.keymap.set("n", "<leader>sch", "<cmd> set cursorline!<CR>", opt)

-- Toggle linenumbers
vim.keymap.set("n", "<leader>sln", "<cmd> set linenumber<CR>", opt)
vim.keymap.set("n", "<leader>slr", "<cmd> set  relativelinenumber<CR>", opt)

--
-- Improve visual mode
--

-- Indent without leaving
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("v", ">", ">gv", opt)

-- replace without changing registers
vim.keymap.set("v", "p", '"_dP"', opt)

--
-- Window Keymappings
--

-- Window focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window resize
vim.keymap.set("n", "<Up>", ":resize -2<CR>")
vim.keymap.set("n", "<Down>", ":resize +2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")

-- Window open/close
vim.keymap.set("n", "<leader>wv", "<C-w>v", opt)
vim.keymap.set("n", "<leader>wh", "<C-w>h", opt)
vim.keymap.set("n", "<leader>wc", ":close", opt)

--
-- Terminal stuff
--

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("t", "<Up>", ":resize -2<CR>")
vim.keymap.set("t", "<Down>", ":resize +2<CR>")
vim.keymap.set("t", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("t", "<Right>", ":vertical resize +2<CR>")

-- Open terminal
vim.keymap.set("n", "<leader>ttn", ":e " .. terminal .. "<CR>", opt)
vim.keymap.set("n", "<leader>ttv", ":vs " .. terminal .. "<CR>", opt)
vim.keymap.set("n", "<leader>tth", ":sp " .. terminal .. "<CR>", opt)

--
-- Buffer Keymappings
--

-- Switch between Buffers
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", opt)
vim.keymap.set("n", "<leader><S-Tab>", ":bprevious<CR>", opt)
vim.keymap.set("n", "<leader>tn", ":enew<CR>", opt)
vim.keymap.set("n", "<leader>tc", ":bd<CR>", opt)

--
-- Miscellaneous
--

-- Diagnostics
-- vim.keymap.set('n', '<leader>ds', vim.diagnostics.setloclist, opt)

--
-- external keybinds
--

-- Jump to the definition of the word under your cursor.
-- This is where a variable was first declared, or where a function is defined, etc.
-- To jump back, press <C-t>.
-- map("<leader>ld", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

-- Find references for the word under your cursor.
-- map("<leader>lr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

-- Jump to the implementation of the word under your cursor.
-- Useful when your language has ways of declaring types without an actual implementation.
-- map("<leader>li", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

-- Jump to the type of the word under your cursor.
-- Useful when you're not sure what type a variable is and you want to see
-- the definition of its *type*, not where it was *defined*.
-- map("<leader>ldt", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

-- Fuzzy find all the symbols in your current document.
-- Symbols are things like variables, functions, types, etc.
-- map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

-- Fuzzy find all the symbols in your current workspace.
-- Similar to document symbols, except searches over your entire project.
-- map("<leader>lsw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

-- Rename the variable under your cursor.
-- Most Language Servers support renaming across files, etc.
-- map("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
-- map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

-- This is not Goto Definition, this is Goto Declaration.
-- For example, in C this would take you to the header.
-- map("<leader>lD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
