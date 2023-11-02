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

  -- Shows a popup when you press a key if it's part of a combination
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
    end,
    opts = {}
  },

  -- vscode like symbols for cmp
  { 'lewis6991/gitsigns.nvim' },

  {
    -- Add indentation guides, even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- gc to comment line(s)
  { 'numToStr/Comment.nvim',  opts = {} },

  -- Enables vscode-like icons for cmp
  { 'onsails/lspkind.nvim' },

  -- Better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate'
  },

  -- Pair parentheses, quotes, and so on
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },

  -- Autopairs for html tags such as <div>
  { 'windwp/nvim-ts-autotag' },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim', -- common utilities
      'nvim-telescope/telescope-file-browser.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
}
