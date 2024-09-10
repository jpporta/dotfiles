return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http" },
		config = function()
			local kulala = require("kulala")
			kulala.setup({})
			vim.keymap.set("n", "<leader>ll", function()
				kulala.run()
			end, { noremap = true, silent = true })
		end,
	},
}
