return {
	"sbdchd/neoformat",
	cmd = { "Neoformat" },
	keys = {
		{
			"<leader>f",
			function()
				vim.cmd("Neoformat")
			end,
			desc = "Format",
		},
	},
	config = function()
		vim.g.neoformat_try_node_exe = 1
	end,
}
