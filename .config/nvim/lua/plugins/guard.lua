return {
	"nvimdev/guard.nvim",
	dependencies = { "nvimdev/guard-collection" },
	config = function()
		local ft = require("guard.filetype")

		ft("typescript,javascript,typescriptreact"):fmt({
			cmd = "prettier",
			args = { "--stdin-filepath" },
			fname = true,
			stdin = true,
		}):lint("eslint_d")

		ft("lua"):fmt("stylua")
		ft("json"):fmt("prettier"):lint("eslint_d")
		ft("nix"):fmt("nixfmt")

		ft("*"):lint("codespell")

		vim.keymap.set("n", "<leader>f", "<cmd>GuardFmt<CR>", { desc = "Format" })

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end,
}
-- return {
-- 	"jose-elias-alvarez/null-ls.nvim",
-- 	event = "VeryLazy",
-- 	opts = function()
-- 		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- 		local null_ls = require("null-ls")
--
-- 		local opts = {
-- 			sources = {
-- 				null_ls.builtins.diagnostics.eslint,

-- 			},
-- 			on_attach = function(client, bufnr)
-- 				if client.supports_method("textDocument/formatting") then
-- 					vim.api.nvim_clear_autocmds({
-- 						group = augroup,
-- 						buffer = bufnr,
-- 					})
-- 					vim.api.nvim_create_autocmd("BufWritePre", {
-- 						group = augroup,
-- 						buffer = bufnr,
-- 						callback = function()
-- 							vim.lsp.buf.format({ bufnr = bufnr })
-- 						end,
-- 					})
-- 				end
-- 			end,
-- 		}
-- 		return opts
-- 	end,
-- }
