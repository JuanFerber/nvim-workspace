return {
	"nvim-mini/mini.surround",
	version = false,
	config = function()
		local ms = require("mini.surround")
		ms.setup({
			mappings = {
				add = "gsa", -- Envolver en modo "visual"
				delete = "gsd", -- Desenvolver en modo "normal"
				replace = "gsr", -- Reemplazar envoltura en modo "normal"
			},
		})
	end,
}
