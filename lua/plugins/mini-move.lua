return {
	"nvim-mini/mini.move",
	version = false,
	config = function()
		local mm = require("mini.move")
		mm.setup({
			mappings = {
				-- Mover en modo "visual"
				left = "<M-Left>",
				right = "<M-Right>",
				down = "<M-Down>",
				up = "<M-Up>",

				-- Mover línea en modo "normal"
				line_left = "<M-Left>",
				line_right = "<M-Right>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
			},
			options = {
				reindent_linewise = true,
			},
		})
	end,
}
