return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Mapeo JSONC al parser de JSON
		vim.treesitter.language.register("json", "jsonc")

		-- Instalar reconocimiento para una lista de lenguajes
		require("nvim-treesitter").install({
			"astro",
			"bash",
			"c",
			"c_sharp",
			"cmake",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"graphql",
			"gitignore",
			"glsl",
			"html",
			"http",
			"javascript",
			"jinja",
			"json",
			"julia",
			"kdl",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"nginx",
			"python",
			"rust",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		})
		-- ensure_installed = {},
		-- Instalar de forma asíncrona (sin bloquear la pantalla hasta terminar)
		-- sync_install = false,
		-- Instalar automáticamente si abres un archivo nuevo
		-- auto_install = true,
		-- highlight = { enable = true },
		-- modules = {},
		-- ignore_install = {},
	end,
}
