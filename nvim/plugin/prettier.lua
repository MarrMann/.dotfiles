require('prettier').setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'scss',
    'less'
  },
  cli_options = {
    single_quote = true,
  }
}
