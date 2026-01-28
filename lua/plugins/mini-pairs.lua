return {
	"nvim-mini/mini.pairs",
	version = false,
	config = function()
		local mp = require("mini.pairs")
		mp.setup({
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		})
	end,
}
