local M = {}

local ignored_filetypes = {
	["neo-tree"] = true,
	["trouble"] = true,
	["TelescopePrompt"] = true,
	["mason"] = true,
	["lazy"] = true,
	["grug-far"] = true,
	["qf"] = true,
	["help"] = true,
	["checkhealth"] = true,
}

function M.safe_cycle_buffer(direction)
	if ignored_filetypes[vim.bo.filetype] or vim.bo.buftype ~= "" then
		return
	end

	vim.cmd(direction == "next" and "bnext" or "bprevious")
end

function M.safe_close_buffer()
	if ignored_filetypes[vim.bo.filetype] or vim.bo.buftype ~= "" then
		vim.notify("Acción bloqueada en buffer especial", vim.log.levels.WARN)
		return
	end

	local buffer_to_delete = vim.api.nvim_get_current_buf()
	pcall(vim.cmd.bprevious)

	if vim.api.nvim_get_current_buf() == buffer_to_delete then
		pcall(vim.cmd.enew)
		pcall(vim.cmd.bdelete, buffer_to_delete)
		pcall(vim.cmd.intro)
	else
		pcall(vim.cmd.bdelete, buffer_to_delete)
	end
end

return M
