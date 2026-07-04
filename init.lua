-- Tecla líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Apago indicadores en CheckHealth de "Perl" y "Ruby"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

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

-- Cargar configuración
require("config.loader")

-- Cargar plugins
require("lazy").setup({
	spec = { import = "plugins" },
	change_detection = { notify = false },
})
