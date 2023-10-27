print('maps loaded!')

local keymap = vim.keymap

-- do not yank with x
keymap.set('n', 'x', '"_x')

-- vscode-like alt+direction to move lines
keymap.set('n', '<a-j>', ':m+<CR>==')
keymap.set('n', '<a-k>', ':m .-2<CR>==')
keymap.set('v', '<a-j>', ":m '>+1<CR>gv=gv")
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
