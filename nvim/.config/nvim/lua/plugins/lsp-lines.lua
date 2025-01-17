return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	event = "VeryLazy",
	config = function()
		require("lsp_lines").setup()
		-- Disable virtual_text since it's redundant due to lsp_lines.
		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.keymap.set(
			"",
			"<Leader>e",
			require("lsp_lines").toggle,
			{ desc = "Toggle lsp_lines" }
		)
	end,
}
