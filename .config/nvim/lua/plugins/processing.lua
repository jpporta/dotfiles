return {
	"sophacles/vim-processing",
	dependencies = { "skywind3000/asyncrun.vim" },
	lazy = true,
	ft = "processing",
	config = function()
		vim.keymap.set("n", "<leader>oo", "<cmd>AsyncRun -program=make @<CR>", { desc = "Run Sketch" })
	end,
}
