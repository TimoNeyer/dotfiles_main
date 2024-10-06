return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("onedarkpro").setup({
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
			},
		})
	end,
}
