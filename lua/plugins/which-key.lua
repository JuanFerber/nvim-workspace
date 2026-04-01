return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "WhichKey",
		},
	},
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
			win = {
				border = "single",
				title = true,
				title_pos = "center",
			},
			filter = function(mapping)
				return mapping.desc and mapping.desc ~= nil and mapping.desc ~= "" and not mapping.builtin
			end,
		})

		wk.add({
			{ "<leader>b", group = "BufferLine" },
			{ "<leader>d", group = "DAP" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>k", group = "Kulala" },
			{ "<leader>t", group = "ToDo" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
