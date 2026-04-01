return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>d<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Iniciar/Continuar debug",
		},
		{
			"<leader>d<S-F5>",
			function()
				require("dap").terminate()
				require("dapui").close()
				pcall(vim.cmd, "Neotree show")
				pcall(vim.cmd, "wincmd p")
			end,
			desc = "Detener debug",
		},
		{
			"<leader>d<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Saltar (Step Over)",
		},
		{
			"<leader>d<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Entrar (Step Into)",
		},
		{
			"<leader>d<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Salir (Step Out)",
		},
		{
			"<leader>dd",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Alternar breakpoint",
		},
		{
			"<leader>dD",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Establecer breakpoint condicional",
		},
	},
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mdap = require("mason-nvim-dap")

		-- Configuración de Mason-DAP
		mdap.setup({
			ensure_installed = { "codelldb" },
			handlers = {},
		})

		-- Configuración de la UI
		dapui.setup()

		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "String", linehl = "CursorLine", numhl = "" })

		-- Manejar automáticamente el cierre y apertura de la UI al iniciar
		local function close_neotree()
			if vim.fn.exists(":Neotree") == 2 then
				vim.cmd("Neotree close")
			end
		end
		dap.listeners.before.attach.dapui_config = function()
			close_neotree()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			close_neotree()
			dapui.open()
		end

		-- Configuración específica para Rust
		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd(), "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
