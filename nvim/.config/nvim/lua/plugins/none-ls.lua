return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local setup, null_ls = pcall(require, "null-ls")
			if not setup then
				return
			end

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					-- Code Actions
					require("none-ls.code_actions.eslint_d"),
					null_ls.builtins.code_actions.gitsigns, -- Optional: git-related code actions
					null_ls.builtins.code_actions.refactoring,
					-- Formatters
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					require("none-ls.formatting.beautysh"),
					-- Diagnostics
					require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.diagnostics.golangci_lint,
					-- Hover documentation (optional)
					null_ls.builtins.hover.dictionary,
				},
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, { desc = "Rename Variable" }),
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format current buffer" }),
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										-- only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^7", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
