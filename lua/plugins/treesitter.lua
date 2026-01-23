return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Instalar reconocimiento para una lista de lenguajes
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"cpp",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"glsl",
				"html",
				"http",
				"javascript",
				"jinja",
				"json",
				"kdl",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"nginx",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			-- Instalar de forma asíncrona (sin bloquear la pantalla hasta terminar)
			sync_install = false,
			-- Instalar automáticamente si abres un archivo nuevo
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
			modules = {},
			ignore_install = {},
		})
	end,
}
