require("base16-colorscheme").setup({
	base00 = "#131318",
	base01 = "#0e0e13",
	base02 = "#1b1b21",
	base03 = "#46464f",
	base04 = "#c7c5d0",
	base05 = "#e4e1e9",
	base06 = "#303036",
	base07 = "#39393f",
	base08 = "#ffb4ab",
	base09 = "#e8b9d5",
	base0A = "#c5c4dd",
	base0B = "#bfc2ff",
	base0C = "#5e3c52",
	base0D = "#3e4278",
	base0E = "#444559",
	base0F = "#93000a",
})
-- Make selected text stand out more
vim.api.nvim_set_hl(0, "Visual", {
	bg = "#3e4278",
	fg = "#131318",
})
