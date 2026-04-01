return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
		})

		local keymap = vim.keymap
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscador de archivos" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscador de palabras en archivos" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscador de documentación" })
		keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "Buscador de símbolos" })
	end,
}
