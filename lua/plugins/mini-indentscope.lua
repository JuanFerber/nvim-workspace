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
			symbol = "›",
		})
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#4D4D4D", bg = "NONE" })
		vim.cmd("hi! link MiniIndentscopeSymbolOff MiniIndentscopeSymbol")
	end,
}
