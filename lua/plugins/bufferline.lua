return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorador",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
