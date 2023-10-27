print('base loaded!')

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.expandtab = true -- expand tabs into space
vim.opt.hlsearch = true -- highlight words on search
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.laststatus = 2
vim.opt.path:append { '**' } -- finding files, search down into subfolders
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.shiftwidth = 2 -- indentation width
vim.opt.showcmd = true
vim.opt.si = true -- smart indent, remembers indent from last line
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.title = true
vim.opt.wildignore:append {'*/node_modules/*' }
vim.opt.wrap = true -- wrap lines

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[e:0m"]])
-- this doesn't yet work on iTerm2.

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

