return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	config = function()
		require("project_nvim").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			patterns = {
				".git",
				"_darcs",
				".hg",
				".bzr",
				"Makefile",
				"makefile",
				"package.json",
				"build.zig",
				"go.mod",
				"go.sum",
				".venv",
				"init.lua",
			},
			vim.keymap.set(
				"n",
				"<leader>po",
				":Telescope projects<CR>",
				{ silent = true, noremap = true, desc = "search Projects" }
			),
		})
	end,
}
