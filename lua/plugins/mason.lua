-- Lenguajes configurados
-- Astro: LSP - Formatter - Linter
-- JS: LSP - Formatter - Linter
-- TS: LSP - Formatter - Linter
-- Bash: LSP - Formatter x 2 - Linter
-- Lua: LSP - Formatter - Linter
-- Python: LSP - Formatter - Linter
-- C: LSP - Formatter - Linter
-- C++: LSP - Formatter - Linter
-- C#: LSP - Formatter
-- JSON: LSP - Formatter - Linter
-- CSS: LSP - Formatter
-- HTML: LSP - Formatter - Linter
-- Rust: LSP - Formatter - Linter
-- TOML: LSP - Formatter - Linter

return {
	"mason-org/mason.nvim",
	opts_extend = { "ensure_installed" },
	opts = {
		ensure_installed = {
			"astro-language-server", -- [LSP] - [Astro]
			"prettier", -- [Formatter] - [Astro, JS, TS, JSON, CSS, HTML]
			"eslint_d", -- [Linter] - [Astro, JS, TS]
			"bash-language-server", -- [LSP] - [Bash]
			"shfmt", -- [Formatter] - [Bash]
			"shellharden", -- [Formatter] - [Bash]
			"shellcheck", -- [Linter] - [Bash]
			"clangd", -- [LSP] - [C, C++]
			"clang-format", -- [Formatter] - [C, C++]
			"cpplint", -- [Linter] - [C, C++]
			"omnisharp", -- [LSP] - [C#]
			"csharpier", -- [Formatter] - [C#]
			"lua-language-server", -- [LSP] - [Lua]
			"stylua", -- [Formatter] - [Lua]
			"luacheck", -- [Linter] - [Lua]
			"pyright", -- [LSP] - [Python]
			"black", -- [Formatter] - [Python]
			"ruff", -- [Linter] - [Python]
			"typescript-language-server", -- [LSP] - [JS, TS]
			"json-lsp", -- [LSP] - [JSON]
			"jsonlint", -- [Linter] - [JSON]
			"css-lsp", -- [LSP] - [CSS]
			"html-lsp", -- [LSP] - [HTML]
			"htmlhint", -- [Linter] - [HTML]
			"marksman", -- [LSP] - [MD]
			"markdownlint", -- [Linter] - [MD]
			"rust-analyzer", -- [LSP] - [Rust]
			"taplo", -- [LSP - Formatter - Linter] - [TOML]
		},
	},
	config = function(_, opts)
		local m = require("mason")
		m.setup(opts)
		local mr = require("mason-registry")
		mr:on("package:install:success", function()
			vim.defer_fn(function()
				require("lazy.core.handler.event").trigger({
					event = "FileType",
					buf = vim.api.nvim_get_current_buf(),
				})
			end, 100)
		end)

		mr.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)
	end,
}
