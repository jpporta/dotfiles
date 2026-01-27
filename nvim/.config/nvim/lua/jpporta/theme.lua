local function source_matugen()
	local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua" -- dofile doesn't expand $HOME or ~

	dofile(matugen_path)
end
local function auxiliary_function()
	source_matugen()
end

-- Register an autocmd to listen for matugen updates
vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = auxiliary_function,
})

source_matugen()
