vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Languages that we want installed for treesitter
    ensure_installed = { 'bash', 'c', 'cpp', 'c_sharp', 'css', 'lua', 'html', 'json', 'scss', 'rust', 'tsx',
      'javascript', 'typescript', 'swift', 'vimdoc', 'vim' },

    auto_install = false,

    autotag = {
      enable = true,
    },

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = ' ', -- option + space
        node_incremental = ' ',
        scope_incremental = 'ß', -- option + s
        node_decremental = 'gnn',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)
