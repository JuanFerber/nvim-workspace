-- Cargar los archivos de configuración
local config_dir = vim.fn.stdpath("config") .. "/lua/config"

for _, file in ipairs(vim.fn.readdir(config_dir)) do
	if file:match("%.lua$") and file ~= "loader.lua" then
		require("config." .. file:gsub("%.lua$", ""))
	end
end
