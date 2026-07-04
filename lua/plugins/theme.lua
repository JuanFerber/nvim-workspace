-- Theme: Onedark --

return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local theme = require("onedark")

		theme.setup({
			style = "deep",
			transparent = true,
			term_colors = false,
			code_style = {
				comments = "none",
				functions = "none",
				keywords = "none",
				strings = "none",
				variables = "none",
			},
			highlights = {
				EndOfBuffer = { fg = "#5c5c5c" },
				WinSeparator = { fg = "#5c5c5c" },
				NeoTreeWinSeparator = { fg = "#5c5c5c" },
			},
		})

		theme.load()
	end,
}

-- Theme: Nightfox --

-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nightfox").setup({
-- 			options = {
-- 				transparent = true,
-- 				terminal_colors = true,
-- 				dim_inactive = false,
-- 				styles = {
-- 					comments = "NONE",
-- 					conditionals = "NONE",
-- 					constants = "NONE",
-- 					functions = "NONE",
-- 					keywords = "NONE",
-- 					numbers = "NONE",
-- 					operators = "NONE",
-- 					strings = "NONE",
-- 					types = "NONE",
-- 					variables = "NONE",
-- 				},
-- 			},
-- 			groups = {
-- 				all = {
-- 					EndOfBuffer = { fg = "#5c5c5c" },
-- 					WinSeparator = { fg = "#5c5c5c" },
-- 					NeoTreeWinSeparator = { fg = "#5c5c5c" },
-- 				},
-- 			},
-- 		})
-- 		vim.cmd("colorscheme nightfox")
-- 	end,
-- }
