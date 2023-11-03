local keymap = vim.keymap

-- do not yank with x
keymap.set('n', 'x', '"_x')

-- vscode-like alt+direction to move lines
-- TODO: set up keymaps for windows
keymap.set('n', '∆', ':m+<CR>==')
keymap.set('n', '˚', ':m .-2<CR>==')
keymap.set('v', '∆', ":m '>+1<CR>gv=gv")
keymap.set('v', '˚', ":m '<-2<CR>gv=gv")

-- new tab
keymap.set('n', 'te', ':tabedit<CR>')

-- remove space normal mapping so it can be used as leader
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
