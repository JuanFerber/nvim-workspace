return {
	"folke/lazydev.nvim",
	ft = "lua",
	dependencies = {
		{ "Bilal2453/luvit-meta" },
	},
	config = function()
		local ok, ld = pcall(require, "lazydev")

		if not ok then
			return
		end

		ld.setup({
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		})
	end,
}
