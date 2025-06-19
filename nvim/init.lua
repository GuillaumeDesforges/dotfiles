vim.g.mapleader = " "

-- use system clipboard to yank/paste
vim.opt.clipboard = "unnamedplus"

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- esc on terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- clear highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- plugins
require("bootstrap/rocks")

-- plugin configs in `./lua/plugins/` are loaded by rocks-configs

