return {
	"mfussenegger/nvim-dap",
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
