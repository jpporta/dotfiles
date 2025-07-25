return {
	cmd = { 'prettierd' },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"css",
		"scss",
		"less",
		"html",
		"json",
		"jsonc",
		"yaml",
		"markdown",
		"markdown.mdx",
		"graphql",
		"handlebars",
		"svelte",
		"astro",
		"htmlangular",
	},
	root_markers = {
		'.prettierrc',
		'.prettierrc.json',
		'.git'
	},
	args = "$FILENAME"
}
