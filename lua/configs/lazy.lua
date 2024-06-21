return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first 
    config = function()
      vim.cmd("colorscheme onedark_vivid")
      --vim.cmd.colorscheme("onedark")
    end,
  },
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      return require "configs.telescope"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "prisma",
        "svelte",
        "vue",
        "json",
        "jsdoc",
        "arduino"
      },
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
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
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("configs.nvim-tree")
  end,
},
{"dcampos/nvim-snippy",
  opts = function()
  return require("configs.nvim-snippy")
  end,
},
{"dcampos/cmp-snippy",
  opts = function()
  return require("configs.cmp-snippy")
  end,
},
}
