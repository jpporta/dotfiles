return {
	{
		"f-person/git-blame.nvim",
		lazy = true,
		cmd = { "GitBlameEnable", "GitBlameDisable", "GitBlameToggle" },
		keys = {
			{
				"<leader>gb",
				":GitBlameToggle<CR>",
				desc = "Toggle Git Blame",
				mode = "n",
			},
		},
	},
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		keys = {
			{
				"<leader>dd",
				":CodeDiff<CR>",
				desc = "Toggle CodeDiff",
				mode = "n",
			},
		},
	},
}
