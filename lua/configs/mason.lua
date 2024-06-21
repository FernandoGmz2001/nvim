return {
	 ensure_installed = {"vue-language-server", "typescript-language-server","tailwindcss-language-server","markdown-oxide","biome","eslint-lsp","unocss-language-server","lua-language-server"},
	 max_concurrent_installers = 10,
	vim.keymap.set("n", "<leader>m",":Mason<CR>")

}

