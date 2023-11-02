local keymap = vim.keymap

-- do not yank with x
keymap.set('n', 'x', '"_x')

-- vscode-like alt+direction to move lines
keymap.set('n', '∆', ':m+<CR>==')
keymap.set('n', '˚', ':m .-2<CR>==')
keymap.set('v', '∆', ":m '>+1<CR>gv=gv")
keymap.set('v', '˚', ":m '<-2<CR>gv=gv")

-- remove space normal mapping so it can be used as leader
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
