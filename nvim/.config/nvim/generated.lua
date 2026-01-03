require("base16-colorscheme").setup({
	base00 = "#121318",
	base01 = "#0d0e13",
	base02 = "#1a1b21",
	base03 = "#45464f",
	base04 = "#c6c6d0",
	base05 = "#e3e1e9",
	base06 = "#2f3036",
	base07 = "#38393f",
	base08 = "#ffb4ab",
	base09 = "#e3badb",
	base0A = "#c1c5dd",
	base0B = "#b5c4ff",
	base0C = "#5b3d57",
	base0D = "#344479",
	base0E = "#414659",
	base0F = "#93000a",
})
-- Make selected text stand out more
vim.api.nvim_set_hl(0, "Visual", {
	bg = "#344479",
	fg = "#121318",
})
