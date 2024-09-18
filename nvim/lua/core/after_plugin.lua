local function toggle_bg()
	BgTransparent = not BgTransparent
	require("onedarkpro").setup({
		options = {
			transparency = BgTransparent,
		},
	})
	vim.cmd("colorscheme onedark")
end

vim.keymap.set("n", "<leader>stt", toggle_bg, { noremap = true, silent = true, desc = "toggle background" })
