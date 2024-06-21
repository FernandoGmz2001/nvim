return {
	ensure_installed = {
		"vue-language-server",
		"typescript-language-server",
		"tailwindcss-language-server",
		"eslint-lsp",
		"unocss-language-server",
		"lua-language-server",
		"html-lsp",
		"prettier",
		"stylua",
		"css-lsp"
	},
	max_concurrent_installers = 18,
	vim.keymap.set("n", "<leader>m", ":Mason<CR>")
}
