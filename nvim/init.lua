-- leader key is spacebar
vim.g.mapleader = " "

-- wrapping
vim.opt.wrap = false
vim.opt.breakindent = true

-- use system clipboard to yank/paste
vim.opt.clipboard = "unnamedplus"

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- show line number
vim.opt.number = true
vim.opt.relativenumber = true

-- esc on terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

-- clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- plugins
require("bootstrap/rocks")

-- plugin configs in `./lua/plugins/` are loaded by rocks-configs
