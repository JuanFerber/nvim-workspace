return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.nvim",
	},
	config = function()
		local rmd = require("render-markdown")
		rmd.setup({})
	end,
}
