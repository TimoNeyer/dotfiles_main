-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, keybind, target, description)
  vim.keymap.set(mode, keybind, target, { noremap = true, silent = true, desc = description })
end

--
-- Core Keymappings
--

map("i", "jj", "<Esc>", "Enter normal mode")
map({ "n", "i", "v" }, "<C-c>", '"+y', "Save to system clipboard")
map({ "n", "i", "v" }, "<C-v>", function()
  local mode = vim.fn.mode()

  if mode == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-r>+", true, false, true), "n", false)
  elseif mode == "v" or mode == "V" or mode == "\22" then
    -- Replace visual selection with clipboard contents
    vim.cmd('normal! "+p')
  else
    -- Normal mode paste
    vim.cmd('normal! "+p')
  end
end, "Paste system clipboard")
map("n", "<C-s>", "<cmd>w<CR>", "save file")
map("n", "<C-q>", "<cmd>wq<CR>", "quit file")
map("n", "<C-S-q>", "<cmd>wqa<CR>", "quit all")
map("i", "<C-BS>", "<C-W>", "Delete work backwards")
map("n", "x", '"_x', "")
map("n", "n", "nzzzv", "")
map("n", "N", "Nzzzv", "")
map("n", "<C-d>", "<C-d>zz", "")
map("n", "<C-u>", "<C-u>zz", "")
map("v", "p", '"_dP"', "")

--
-- Window Keymappings
--

-- Window open/close
map("t", "<C-h>", "<C-\\><C-N><C-w><C-h>", "Move focus to the left window")
map("t", "<C-l>", "<C-\\><C-N><C-w><C-l>", "Move focus to the right window")
map("t", "<C-j>", "<C-\\><C-N><C-w><C-j>", "Move focus to the lower window")
map("t", "<C-k>", "<C-\\><C-N><C-w><C-k>", "Move focus to the upper window")
map("t", "<Esc>", "<C-\\><C-N>")
