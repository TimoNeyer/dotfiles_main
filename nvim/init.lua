require("core.options")
require("core.keymaps")
require("core.snippets")

BgTransparent = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.autocomplete"),
	require("plugins.autotag"),
	require("plugins.bufferline"),
	require("plugins.dashboard"),
	require("plugins.git"),
	require("plugins.goto-preview"),
	require("plugins.lsp"),
	require("plugins.lualine"),
	require("plugins.misc"),
	require("plugins.neotree"),
	require("plugins.none-ls"),
	require("plugins.onedark"),
	require("plugins.project-manager"),
	require("plugins.telescope"),
	require("plugins.tracker"),
	require("plugins.treesitter"),
	require("plugins.ziglang"),
})

require("core.after_plugin")

vim.cmd("colorscheme onedark")
