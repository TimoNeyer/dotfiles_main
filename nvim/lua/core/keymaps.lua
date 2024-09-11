--
-- NeoVim Keybindings
--

--
-- Convention:
--  leader + d -> diagnostics
--  leader + <tab> -> tabs
--  leader + w -> window
--

local opt = {noremap = true, silent = true}

--
-- Handy helper stuff
--

-- Set Esc to remove highlights
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', opt)

-- Enter command mode
vim.keymap.set('n', '<leader>c', ':', opt)

-- Set save and quit with Control
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opt)
vim.keymap.set('n', '<C-q>', '<cmd>wq<CR>', opt)

-- Do not yank when deleting single char
vim.keymap.set('n', 'x', '"_x', opt)

-- Improve searching in buffer
vim.keymap.set('n', 'n', 'nzzzv', opt)
vim.keymap.set('n', 'N', 'Nzzzv', opt)

-- Improve vertival scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz', opt)
vim.keymap.set('n', '<C-u>', '<C-d>zz', opt)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>tlw', '<cmd>set wrap!<CR>', opt)

-- Set jj to escape
vim.keymap.set('i', 'jj', '<Esc>', opt)

-- Set overwrite to leader
vim.keymap.set('n', '<leader>w', ':w', opt)
vim.keymap.set('n', '<leader>q', ':q', opt)
vim.keymap.set('n', '<leader>wq', ':wq', opt)
vim.keymap.set('n', '<leader>e', ':e', opt)


--
-- Improve visual mode
--

-- Indent without leaving
vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)

-- replace without changing registers
vim.keymap.set('v', 'p', '"_dP"', opt)


--
-- Window Keymappings
--

-- Window focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window resize
vim.keymap.set('n', '<Up>', ':resize -2<CR>')
vim.keymap.set('n', '<Down>', ':resize +2<CR>')
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>')

-- Window open/close
vim.keymap.set('n', '<leader>wv', '<C-w>v', opt)
vim.keymap.set('n', '<leader>wh', '<C-w>h', opt)
vim.keymap.set('n', '<leader>wc', ':close', opt)


--
-- Buffer Keymappings
--

-- Switch between Buffers
vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', opt)
vim.keymap.set('n', '<leader><S-Tab>', ':bprevious<CR>', opt)
vim.keymap.set('n', '<leader>tn', ':enew<CR>', opt)
vim.keymap.set('n', '<leader>tc', ':bd<CR>', opt)


--
-- Miscellaneous
--

-- Diagnostics
-- vim.keymap.set('n', '<leader>ds', vim.diagnostics.setloclist, opt)
