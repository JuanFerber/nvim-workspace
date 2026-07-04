return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>e", ":Neotree focus<CR>", desc = "NeoTree" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local nt = require("neo-tree")
		nt.setup({
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = true,
					hide_gitignored = true,
					show_hidden_count = false,
				},
				follow_current_file = {
					enabled = true, -- Enfocar el archivo que estás editando en el árbol
				},
			},
			window = {
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = true } },
				},
			},
		})
	end,
}
