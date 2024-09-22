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

local terminal = "term://zsh"

local function map(mode, keybind, target, description)
	vim.keymap.set(mode, keybind, target, { noremap = true, silent = true, desc = description })
end

--
-- Handy helper stuff
--

-- Set Esc to remove highlights
map("n", "<Esc>", "<cmd>noh<CR>", "Remove search highlights")

-- Enter command mode
map("n", "<leader>c", ": ", "enter command mode")

-- Set save and quit with Control
map("n", "<C-s>", "<cmd>w<CR>", "save file")
map("n", "<C-q>", "<cmd>wq<CR>", "quit file")

-- Do not yank when deleting single char
map("n", "x", '"_x', "")

-- Improve searching in buffer
map("n", "n", "nzzzv", "")
map("n", "N", "Nzzzv", "")

-- Improve vertival scroll
map("n", "<C-d>", "<C-d>zz", "")
map("n", "<C-u>", "<C-d>zz", "")

-- Toggle line wrapping
map("n", "<leader>stw", "<cmd>set wrap!<CR>", "Toggle wrapping of line")

-- Set jj to escape
map("i", "jj", "<Esc>", "Enter normal mode")

-- Set overwrite to leader
map("n", "<leader>w", ":w", "begin write")
map("n", "<leader>ww", ":w<CR>", "write file")
map("n", "<leader>q", ":q<CR>", "quit file")
map("n", "<leader>wq", ":wq<CR>", "save and quit")
map("n", "<leader>e", ":e", "edit")

-- Easier exit
map("n", "<leader>sq", ":wqa<CR>", "write and quit all")
map("n", "<leader>sQ", ":qa!<CR>", "quit all (force)")
map("n", "<leader>sqq", ":qa<CR>", "quit all")

-- Toggle vertical column
map("n", "<leader>stc", "<cmd> set cursorcolumn!<CR>", "toggle cursor column")
map("n", "<leader>stl", "<cmd> set cursorline!<CR>", "toggle cursor line")

-- Toggle linenumbers
map("n", "<leader>stn", "<cmd> set linenumber<CR>", "toggle linenumber")
map("n", "<leader>str", "<cmd> set  relativelinenumber<CR>", "toggle relative linenumber")

--
-- Improve visual mode
--

-- Indent without leaving
map("v", "<", "<gv", "")
map("v", ">", ">gv", "")

-- replace without changing registers
map("v", "p", '"_dP"', "")

--
-- Window Keymappings
--

-- Window focus
map("n", "<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("n", "<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("n", "<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("n", "<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- Window resize
map("n", "<Up>", ":resize -2<CR>", "resive window upwards")
map("n", "<Down>", ":resize +2<CR>", "resize window downwards")
map("n", "<Left>", ":vertical resize -2<CR>", "resize window left")
map("n", "<Right>", ":vertical resize +2<CR>", "resize window right")

-- Window open/close
map("n", "<leader>wv", "<C-w>v", "split buffer vertical")
map("n", "<leader>wh", "<C-w>h", "split buffer horizontal")
map("n", "<leader>wc", ":close", "close buffer")

--
-- Terminal stuff
--

map("t", "<C-h>", "<C-\\><C-N><C-w><C-h>", "Move focus to the left window")
map("t", "<C-l>", "<C-\\><C-N><C-w><C-l>", "Move focus to the right window")
map("t", "<C-j>", "<C-\\><C-N><C-w><C-j>", "Move focus to the lower window")
map("t", "<C-k>", "<C-\\><C-N><C-w><C-k>", "Move focus to the upper window")
map("t", "<C-Up>", "<C-w>+")
map("t", "<C-Down>", "<C-w>-")
map("t", "<C-Left>", "<C-w>>")
map("t", "<C-Right>", "<C-w><")
map("t", "<Esc>", "<C-\\><C-N>")

-- Open terminal
map("n", "<leader>ttn", ":e " .. terminal .. "<CR>", "Open terminal in new buffer")
map("n", "<leader>ttv", ":vs " .. terminal .. "<CR>", "Open terminal vertical split")
map("n", "<leader>tth", ":sp " .. terminal .. "<CR>", "Open terminal horizontal split")
map(
	"n",
	"<leader>ttt",
	":sp " .. terminal .. " <CR><C-\\><C-N>:resize -20<CR>i",
	"Open small terminal horizontal split"
)

--
-- Buffer Keymappings
--

-- Switch between Buffers
map("n", "<leader><Tab>", ":bnext<CR>", "switch to next buffer")
map("n", "<leader><S-Tab>", ":bprevious<CR>", "switch to previous buffer")
map("n", "<leader>tn", ":enew<CR>", "create new buffer")
map("n", "<leader>tc", ":bd<CR>", "close current buffer")

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
-- map("<leader>ld", require("goto-preview").goto_preview_definition, "preview definition")
-- map("<leader>ltd", require("goto-preview").goto_preview_type_definition, "preview type definition")
-- map("<leader>li", require("goto-preview").goto_preview_implementation, "preview implementation")
-- map("<leader>lD", require("goto-preview").goto_preview_declaration, "preview declaration")
-- map("<leader>lc", require("goto-preview").close_all_win, "close all preview windows")

-- project-manager
-- vim.keymap.set( "n", "<leader>po", ":Telescope projects<CR>", { silent = true, noremap = true, desc = "search Projects" }),
