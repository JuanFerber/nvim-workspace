return {
	"nvim-mini/mini.indentscope",
	version = false,
	config = function()
		local mis = require("mini.indentscope")
		mis.setup({
			draw = {
				delay = 0,
				animation = mis.gen_animation.none(),
			},
			options = {
				try_as_border = true,
			},
			symbol = "›",
		})
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#3D3D3D", bg = "NONE" })
		vim.cmd("hi! link MiniIndentscopeSymbolOff MiniIndentscopeSymbol")
	end,
}
