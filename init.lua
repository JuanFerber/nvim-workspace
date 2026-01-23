-- Tecla líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Gestor de plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Cargar plugins
require("lazy").setup({
	spec = { import = "plugins" },
	change_detection = { notify = false },
})

-- Cargar configuración
require("config.loader")
