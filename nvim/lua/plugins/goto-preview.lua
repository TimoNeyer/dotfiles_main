return {
	"rmagatti/goto-preview",
	priority = 500,
	event = "BufEnter",
	config = function()
		require("goto-preview").setup({
			width = 120,
			height = 15,
			border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
			default_mappings = false,
			debug = false,
			opacity = 15,
			resizing_mappings = true,
			post_open_hook = nil,
			post_close_hook = nil,
			references = {
				telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
			},

			focus_on_open = true,
			dismiss_on_move = false,
			force_close = true,
			bufhidden = "wipe",
			stack_floating_preview_windows = true,
			preview_window_title = { enable = true, position = "left" },
			zindex = 1,
		})
		-- Keymaps
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc, noremap = true, silent = true })
		end

		map("<leader>ld", require("goto-preview").goto_preview_definition, "preview definition")
		map("<leader>ltd", require("goto-preview").goto_preview_type_definition, "preview type definition")
		map("<leader>li", require("goto-preview").goto_preview_implementation, "preview implementation")
		map("<leader>lD", require("goto-preview").goto_preview_declaration, "preview declaration")
		map("<leader>lc", require("goto-preview").close_all_win, "close all preview windows")
	end,
	lazy = false,
}
