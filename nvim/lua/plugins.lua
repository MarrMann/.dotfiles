return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = true,
  lazy = false,

  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",

  -- LSP Config & plugins, settings are in plugin/lspconfig.lua
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- mason for managing LSPs, DAPs, linters, and formatters
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- status indicator for lsp
      { 'j-hui/fidget.nvim', tag = 'legacy', event = 'LspAttach', opts = {} },

      -- Plugin dev help with signature help, documentation, and completions for the nvim lua API
      'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet engine
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- LSP autocompletion
      'hrsh7th/cmp-nvim-lsp',

      -- Some user friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
    end,
    opts = {}
  }
}
