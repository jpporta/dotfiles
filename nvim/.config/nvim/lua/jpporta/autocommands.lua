vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set spell" })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = "*.http", command = "set ft=http" })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = "*.templ", command = "set ft=templ" })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

