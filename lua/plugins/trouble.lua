return {
	"folke/trouble.nvim",
	keys = {
		{ "<leader>xx", ":Trouble diagnostics toggle<CR>", desc = "Alternar diagnósticos" },
		{ "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "Alternar diagnósticos del buffer" },
		{ "<leader>xf", ":Trouble diagnostics focus<CR>", desc = "Enfocar diagnósticos" },
		{ "<leader>xc", ":Trouble diagnostics close<CR>", desc = "Cerrar diagnósticos" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
}
