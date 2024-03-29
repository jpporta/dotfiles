return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { { "prettierd", "prettier", "jsbeautify" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier", "jsbeautify" } },
			typescriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			rust = { "rustfmt" },
			go = { "goimports" },
			java = { "google-java-format" },
			processing = { "google-java-format" },
			markdown = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			desc = "Format file",
		},
	},
}
