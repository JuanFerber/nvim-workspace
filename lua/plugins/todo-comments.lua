return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>tt", ":TodoTelescope<CR>", desc = "Abrir buscador de tareas" },
	},
	config = function()
		local todo = require("todo-comments")

		todo.setup({
			signs = false,
		})
	end,
}
