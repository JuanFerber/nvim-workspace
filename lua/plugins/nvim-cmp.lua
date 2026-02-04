return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Tomar el texto del archivo actual
		"hrsh7th/cmp-path", -- Rutas de archivos
		"hrsh7th/cmp-nvim-lsp", -- Sugerencias de LSP
		"hrsh7th/cmp-cmdline", -- Sugerencias de comandos
		{
			"L3MON4D3/LuaSnip", -- Motor de snippets
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- Conexión entre cmp y luasnip
		"rafamadriz/friendly-snippets", -- Colección de snippets populares
		"onsails/lspkind.nvim", -- Mostrar íconos en el menú
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Cargar snippets tipo VSCode
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			-- Configuración de interactividad
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- Configuración de recomendaciones
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.length,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.order,
				},
			},

			-- Bordes de ventanas e íconos
			window = {
				completion = {
					border = "solid",
					winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					col_offset = 0,
					side_padding = 0,
				},
				documentation = {
					border = "solid",
					winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					col_offset = 0,
					side_padding = 0,
				},
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local original_kind = vim_item.kind

					-- Generar ícono
					local kind = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
					})(entry, vim_item)

					-- Ajustar ícono
					kind.kind = " " .. (kind.kind or "?") .. " "

					-- Info a la derecha
					local source = " [" .. (entry.source.name or "") .. "]"
					kind.menu = "(" .. original_kind .. ") " .. source
					return kind
				end,
			},

			-- Mapeo de teclas
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll para arriba
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll para abajo
				["<C-Space>"] = cmp.mapping.complete(), -- Forzar autocompletado
				["<C-e>"] = cmp.mapping.abort(), -- Cancelar
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter para confirmar
			}),

			-- Fuentes de autocompletado
			sources = cmp.config.sources({
				{ name = "lazydev", group_index = 0 }, -- LazyDev
				{ name = "nvim_lsp" }, -- LSP
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Texto del archivo
				{ name = "path" }, -- Rutas del sistema
			}),
		})
	end,
}
