return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<S-M-Left>", ":BufferLineCyclePrev<CR>", desc = "Ir al buffer anterior" },
		{ "<S-M-Right>", ":BufferLineCycleNext<CR>", desc = "Ir al buffer siguiente" },
		{
			"<leader>bd",
			function()
				local buffer_to_delete = vim.api.nvim_get_current_buf()
				pcall(vim.cmd, "bprevious")
				if vim.api.nvim_get_current_buf() == buffer_to_delete then
					pcall(vim.cmd, "enew")
					pcall(vim.cmd, "bdelete " .. buffer_to_delete)
					pcall(vim.cmd, "intro<Esc>")
				else
					pcall(vim.cmd, "bdelete " .. buffer_to_delete)
				end
			end,
			desc = "Eliminar buffer actual",
		},
	},
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
