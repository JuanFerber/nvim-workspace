return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true,
			ts_config = {
				-- Desactiva el autocompletado de pares en contextos específicos
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
			},
			map_cr = true,
			disable_filetype = { "TelescopePrompt", "vim" },
		})
	end,
}
