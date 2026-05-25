local keymap = vim.keymap

-- Globales
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar cambios" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Guardar cambios e ir al modo normal" })
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Limpiar resaltado de búsqueda" })
keymap.set("n", "<S-Esc>", function()
	local has_luasnip, luasnip = pcall(require, "luasnip")
	if has_luasnip and luasnip.in_snippet() then
		luasnip.unlink_current()
	end
end, { desc = "Cancelar snippet activo" })

-- Reemplazo
keymap.set("x", "<leader>r", ":s/\\%V", { desc = "Estructura de reemplazo" })

-- Movimiento entre ventanas
keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Ir a la ventana de la izquierda", remap = true })
keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Ir a la ventana de abajo", remap = true })
keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Ir a la ventana de arriba", remap = true })
keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Ir a la ventana de la derecha", remap = true })

-- Redimensionar ventanas
keymap.set("n", "<C-M-Up>", "<CMD>resize +2<CR>", { desc = "Aumentar altura" })
keymap.set("n", "<C-M-Down>", "<CMD>resize -2<CR>", { desc = "Disminuir altura" })
keymap.set("n", "<C-M-Left>", ":vertical resize -2<CR>", { desc = "Disminuir ancho" })
keymap.set("n", "<C-M-Right>", ":vertical resize +2<CR>", { desc = "Aumentar ancho" })

-- Seleccionar todo el código
keymap.set("n", "gG", "gg0:normal v<CR>G$", { desc = "Seleccionar todo el archivo" })

-- LazyDev
keymap.set("n", "<leader>l", ":Lazy check<CR>", { desc = "LazyDev" })

-- Desactivar "keymaps" predeterminadas
keymap.set({ "n", "x" }, "gs", "<Nop>")
