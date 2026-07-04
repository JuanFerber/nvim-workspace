local function augroup(name)
	return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

-- Resaltar al copiar
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Habilitar Treesitter highlighting para todos los tipos de archivo
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("treesitter_highlight"),
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- Limpiar buffers especiales de la memoria al cerrar su ventana
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf", -- Quickfix
		"help", -- Ventanas de ayuda
		"man", -- Manuales
		"checkhealth", -- Checkhealth
		"lspinfo", -- Info del LSP
		"lazy", -- Interfaz de Lazy
		"mason", -- Interfaz de Mason
	},
	callback = function(event)
		-- Le decimos a Lualine que ignore este archivo (no listado)
		vim.bo[event.buf].buflisted = false

		-- Le decimos a Neovim que borre el archivo de la RAM al cerrar la ventana
		vim.bo[event.buf].bufhidden = "wipe"

		-- Nos aseguramos de que presionar 'q' cierre la ventana rápidamente
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Forzar pintado de fila y limpiar UI para Grug-Far
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("grug_far_cursorline"),
	pattern = "grug-far",
	callback = function(args)
		local grug_buf = args.buf

		-- Limpieza visual en la UI de Grug-Far
		vim.wo.list = false -- Apaga los listchars nativos de Neovim
		vim.b[grug_buf].miniindentscope_disable = true -- Apaga mini-indentscope

		-- Guardamos el ID de la ventana del código en el instante exacto en que se abre Grug-Far.
		local target_win = vim.fn.win_getid(vim.fn.winnr("#"))

		-- Creamos un subgrupo específico para este buffer para evitar fugas de memoria o duplicados
		local buf_group = vim.api.nvim_create_augroup("grug_far_hl_" .. grug_buf, { clear = true })

		-- Evento: Al movernos en Grug-Far, forzamos que se pinte la línea en la ventana capturada
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = buf_group,
			buffer = grug_buf,
			callback = function()
				if vim.api.nvim_win_is_valid(target_win) then
					vim.wo[target_win].cursorline = true
				end
			end,
		})

		-- Evento: Al salir de Grug-Far, apagamos el color para devolver el editor limpio
		vim.api.nvim_create_autocmd("BufLeave", {
			group = buf_group,
			buffer = grug_buf,
			callback = function()
				if vim.api.nvim_win_is_valid(target_win) then
					vim.wo[target_win].cursorline = false
				end
			end,
		})
	end,
})
