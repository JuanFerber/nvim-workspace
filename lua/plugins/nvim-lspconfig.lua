return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		-- 1. Configurar capacidades (para autocompletado)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 2. Configurar función on_attach (atajos de teclado)
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, silent = true }

			opts.desc = "Ver documentación"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Ir a la definición"
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "Renombrar"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Acción de código"
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		end

		-- 3. Configurar mason-lspconfig con handlers integrados
		mason_lspconfig.setup({
			ensure_installed = {
				"astro", -- Astro
				"bashls", -- Bash
				"clangd", -- C
				"omnisharp", -- C#
				"lua_ls", -- Lua
				"pyright", -- Python
				"ts_ls", -- JS - TS
				"jsonls", -- JSON
				"cssls", -- CSS
				"html", -- HTML
			},
			automatic_installation = true,
			handlers = {
				-- El handler por defecto
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
