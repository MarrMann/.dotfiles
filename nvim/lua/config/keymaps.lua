-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyLazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- do not yank with x
keymap.set("n", "x", '"_x')

-- vscode-like alt+direction to move lines
-- TODO: set up keymaps for windows
keymap.set("n", "∆", ":m+<CR>==")
keymap.set("n", "˚", ":m .-2<CR>==")
keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- Remap for word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Copilot accept
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
