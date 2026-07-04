return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local util = require("lspconfig.util")

		-- Configurar capacidades (para autocompletado)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configurar función on_attach (atajos de teclado)
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

		-- Configurar servidores con vim.lsp.config

		-- C - C++
		vim.lsp.config("clangd", {
			on_attach = on_attach,
			capabilities = vim.tbl_extend("force", capabilities, { offsetEncoding = "utf-16" }),
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		})

		-- Rust
		vim.lsp.config("rust_analyzer", {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "rust" },
			root_dir = function(fname)
				return util.root_pattern("Cargo.toml")(fname)
			end,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					procMacro = {
						enable = true,
					},
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})

		-- TOML
		vim.lsp.config("taplo", {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "toml" },
			single_file_support = true,
			root_markers = {
				".taplo.toml",
				"taplo.toml",
				".git",
				"tauri.conf.json",
				"Tauri.toml",
				"Cargo.lock",
				"package.json",
				"Cargo.toml",
			},
		})

		-- YAML
		vim.lsp.config("yamlls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					},
					format = {
						enable = true,
					},
					validate = true,
					completion = true,
				},
			},
		})

		-- JS - TS
		vim.lsp.config("ts_ls", {
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					importModuleSpecifierPreference = "non-relative",
					importModuleSpecifierEnding = "minimal",
				},
			},
		})

		-- Servidores con configuración por defecto
		for _, server in ipairs({
			"astro", -- Astro
			"omnisharp", -- C#
			"lua_ls", -- Lua
			"pyright", -- Python
			"jsonls", -- JSON
			"cssls", -- CSS
			"html", -- HTML
			"marksman", -- MD
			"tailwindcss", -- TailwindCSS
		}) do
			vim.lsp.config(server, {
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		-- Configuración manual para Bash y Zsh
		vim.lsp.config("bashls", {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "sh", "bash", "zsh" },
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"astro",
				"bashls",
				"clangd",
				"omnisharp",
				"lua_ls",
				"pyright",
				"ts_ls",
				"jsonls",
				"cssls",
				"html",
				"marksman",
				"rust_analyzer",
				"taplo",
				"yamlls",
				"tailwindcss",
			},
			automatic_enable = true,
		})
	end,
}
