return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local ll = require("lualine")

		ll.setup({
			tabline = {
				lualine_a = {
					{
						"buffers",
						mode = 2,
						path = 0,
						use_mode_colors = true,
						show_modified_status = true,
						filetype_names = {
							["neo-tree"] = "File Explorer",
						},
					},
				},
			},
			options = {
				theme = "auto",
				globalstatus = true,
			},
		})
	end,
}
