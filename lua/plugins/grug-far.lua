return {
	"MagicDuck/grug-far.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "GrugFar", "GrugFarWithin" },
	keys = {
		{
			"<leader>gg",
			function()
				require("grug-far").open({
					transient = true,
				})
			end,
			mode = { "n", "x" },
			desc = "Buscar y reemplazar",
		},
		{
			"<leader>gl",
			function()
				require("grug-far").open({
					transient = true,
					prefills = {
						paths = vim.fn.expand("%"),
					},
				})
			end,
			mode = { "n", "x" },
			desc = "Buscar y reemplazar en archivo actual",
		},
	},
	config = function()
		local gf = require("grug-far")
		gf.setup({
			windowCreationCommand = "botright vsplit",
			openTargetWindow = {
				preferredLocation = "prev",
			},
			keymaps = {
				close = { n = "<leader>q" },
				syncLine = { n = "<leader>l" },
				syncAll = { n = "<leader>a" },
			},
		})
	end,
}
