return {
	"krivahtoo/silicon.nvim",
	build = "./install.sh",
	lazy = true,
	cmd = "Silicon",
	config = function()
		local get_visual = function()
			local curpos = vim.fn.getcurpos()
			local one = { row = curpos[2] - 1, col = curpos[3] - 1 }
			local two = { row = vim.fn.line("v") - 1, col = vim.fn.col("v") - 1 }

			if one.row == two.row then
				if one.col > two.col then
					local tmp = one
					one = two
					two = tmp
				end
			elseif one.row > two.row then
				local tmp = one
				one = two
				two = tmp
			end

			two.col = two.col + 1
			return one.row
		end
		require("silicon").setup({
			output = {
				clipboard = true,
			},
			font = "Berkeley Mono Nerd Font=26",
			background = "#11111b",
			line_number = true,
			pad_vert = 80,
			pad_horiz = 50,
			window_controls = false,
			line_offset = get_visual() + 1,
			watermark = {
				text = " @jpporta",
				style = "bold",
				color = "#cdd6f4",
			},
			window_title = function()
				return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
			end,
			theme = "Catppuccin Mocha",
		})
	end,
}
