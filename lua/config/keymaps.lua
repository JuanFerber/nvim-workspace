local keymap = vim.keymap
local cmd = function(c)
	vim.cmd(c)
end

-- Globales
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar cambios" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Guardar cambios e ir al modo normal" })
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Limpiar resaltado de búsqueda" })

-- Reemplazo
keymap.set("x", "<leader>r", ":s/\\%V", { desc = "Estructura de reemplazo" })

-- Movimiento entre ventanas
keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Ir a la ventana de la izquierda", remap = true })
keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Ir a la ventana de abajo", remap = true })
keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Ir a la ventana de arriba", remap = true })
keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Ir a la ventana de la derecha", remap = true })

-- Redimensionar ventanas
keymap.set("n", "<C-M-Up>", ":resize +2<CR>", { desc = "Aumentar altura" })
keymap.set("n", "<C-M-Down>", ":resize -2<CR>", { desc = "Disminuir altura" })
keymap.set("n", "<C-M-Left>", ":vertical resize -2<CR>", { desc = "Disminuir ancho" })
keymap.set("n", "<C-M-Right>", ":vertical resize +2<CR>", { desc = "Aumentar ancho" })

-- Seleccionar todo el código
keymap.set("n", "gG", "gg0:normal v<CR>G$", { desc = "Seleccionar todo el archivo" })

-- Mason
keymap.set("n", "<leader>cm", ":Mason<CR>", { desc = "Abrir Mason" })

-- LazyDev
keymap.set("n", "<leader>l", ":Lazy check<CR>", { desc = "Verificar Lazy" })

-- NeoTree
keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Enfocar explorador" })

-- Trouble
keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { desc = "Alternar diagnósticos" })
keymap.set(
	"n",
	"<leader>xX",
	":Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Alternar diagnósticos del buffer" }
)
keymap.set("n", "<leader>xf", ":Trouble diagnostics focus<CR>", { desc = "Enfocar diagnósticos" })
keymap.set("n", "<leader>xc", ":Trouble diagnostics close<CR>", { desc = "Cerrar diagnósticos" })

-- Persistence
keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Restaurar sesión" })
keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Seleccionar sesión" })
keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Cargar última sesión" })
keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "No guardar sesión al salir" })

-- Bufferline
keymap.set("n", "<S-M-Left>", ":BufferLineCyclePrev<CR>", { desc = "Ir al buffer anterior" })
keymap.set("n", "<S-M-Right>", ":BufferLineCycleNext<CR>", { desc = "Ir al buffer siguiente" })
keymap.set("n", "<leader>bd", function()
	local buffer_to_delete = vim.api.nvim_get_current_buf()
	pcall(cmd, "bprevious")
	if vim.api.nvim_get_current_buf() == buffer_to_delete then
		pcall(cmd, "enew")
		pcall(cmd, "bdelete " .. buffer_to_delete)
		pcall(cmd, "intro<Esc>")
	else
		pcall(cmd, "bdelete " .. buffer_to_delete)
	end
end, { desc = "Eliminar buffer actual" })

-- DAP
keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Iniciar/Continuar debug" })
keymap.set("n", "<S-F5>", function()
	require("dap").terminate()
	require("dapui").close()
	pcall(cmd, "Neotree show")
	pcall(cmd, "wincmd p")
end, { desc = "Detener debug" })
keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Saltar (Step Over)" })
keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Entrar (Step Into)" })
keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Salir (Step Out)" })
keymap.set("n", "<leader>d", function()
	require("dap").toggle_breakpoint()
end, { desc = "Alternar breakpoint" })
keymap.set("n", "<leader>D", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Establecer breakpoint condicional" })

-- Desactivar "keymaps" predeterminadas
keymap.set({ "n", "x" }, "gs", "<Nop>")
