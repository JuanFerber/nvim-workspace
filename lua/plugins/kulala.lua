return {
	"mistweaverco/kulala.nvim",
	keys = {
		{
			"<leader>ks",
			function()
				require("kulala").run()
			end,
			desc = "Enviar petición",
		},
		{
			"<leader>kb",
			function()
				require("kulala").scratchpad()
			end,
			desc = "Abrir bloc de notas",
		},
		{
			"<leader>kf",
			function()
				require("kulala").search()
			end,
			desc = "Buscar petición",
			ft = {
				"http",
				"rest",
			},
		},
		{
			"<leader>ki",
			function()
				require("kulala").inspect()
			end,
			desc = "Inspeccionar petición",
		},
		{
			"<leader>ka",
			function()
				require("kulala").run_all()
			end,
			desc = "Enviar todas las peticiones",
		},
		{
			"<leader>kq",
			function()
				require("kulala").close()
			end,
			desc = "Cerrar Kulala",
			ft = {
				"http",
				"rest",
			},
		},
	},
	ft = { "http", "rest" },
	opts = {
		default_view = "headers_body",
		global_keymaps = false,
	},
}
