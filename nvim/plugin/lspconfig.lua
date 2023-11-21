require('mason').setup()
require('mason-lspconfig').setup()
require('fidget').setup()

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}
lspconfig.rust_analyzer.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buffer, desc = '[g]o to [D]eclaration' })
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts,
      { buffer = ev.buffer, desc = '[g]o to [d]efinition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buffer })
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations,
      { buffer = ev.buffer, desc = '[g]o to [i]mplementation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buffer, desc = 'show signature help' })
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
      { buffer = ev.buffer, desc = '[w]orkspace: add [f]older' })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
      { buffer = ev.buffer, desc = '[w]orkspace: remove [f]older' })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buffer, desc = '[w]orkspace: list folders' })
    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions,
      { buffer = ev.buffer, desc = 'type [D]efinition' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buffer, desc = '[r]e[n]ame' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buffer, desc = '[c]ode [a]ction' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
      { buffer = ev.buffer, desc = '[g]o to [r]eferences' })
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
      { buffer = ev.buffer, desc = '[d]ocument [s]ymbols' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { buffer = ev.buffer, desc = '[w]orkspace [s]ymbols' })
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = buffer,
      callback = function()
        vim.lsp.buf.format { async = false }
      end
    })
  end,
})

require('which-key').register {
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
