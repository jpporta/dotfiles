return {
	cmd = { 'eslint_d' },
	args = { '--stdin', '--stdin-filename', '--fix-to-stdout', '$FILENAME' },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
	},
	root_markers = {
		'.eslintrc',
		'.git'
	},
}
