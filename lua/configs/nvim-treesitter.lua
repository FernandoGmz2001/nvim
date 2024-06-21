require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "javascript", "typescript", "tsx", "yaml", "prisma",
        "svelte", "vue", "json", "jsdoc", "arduino", "python"
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}