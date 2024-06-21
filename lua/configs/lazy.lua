return {{
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first 
    config = function()
        vim.cmd("colorscheme onedark_vivid")
        -- vim.cmd.colorscheme("onedark")
    end
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = function()
        return require "configs.telescope"
    end
}, {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vim", "lua", "vimdoc", "html", "css", "javascript", "typescript", "tsx", "yaml", "prisma",
            "svelte", "vue", "json", "jsdoc", "arduino", "python"
        },
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    },
    config = function()
        require("configs.nvim-treesitter")
    end
}, {
    "williamboman/mason.nvim",
    cmd = {"Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll"},
    opts = function()
        return require("configs.mason")
    end,
    config = function(_, opts)
        require("mason").setup(opts)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end
        end, {})
        vim.g.mason_binaries_list = opts.ensure_installed
    end
}, {"williamboman/mason-lspconfig.nvim"}, {
    "neovim/nvim-lspconfig",
    dependencies = {{"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"}},
    config = function()
        require("configs.lspconfig")
    end
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("configs.nvim-tree")
    end
}, {
    'MunifTanjim/prettier.nvim',
    config = function()
        require("configs.prettier")
    end
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require("lualine").setup({
            options = {
                theme = "onedark"
            }
        })
    end
}, {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require("configs.telescope-ui-select")
    end

}, {
    "goolord/alpha-nvim",
    config = function()
        require("configs.alpha")
    end
}, {"hrsh7th/cmp-nvim-lsp"}, {
    "L3MON4D3/LuaSnip",
    dependencies = {"saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"}
}, {
    "hrsh7th/nvim-cmp",
    config = function()
        require("configs.completitions")
    end
}
--, {
--     'axelvc/template-string.nvim',
--     config = function()
--         require('template-string').setup({
--             filetypes = {
--                 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte', 'python'
--             }, -- filetypes where the plugin is active
--             jsx_brackets = true, -- must add brackets to JSX attributes
--             remove_template_string = false, -- remove backticks when there are no template strings
--             restore_quotes = {
--                 -- quotes used when "remove_template_string" option is enabled
--                 normal = [[']],
--                 jsx = [["]]
--             }
--         })
--     end
-- }
}
