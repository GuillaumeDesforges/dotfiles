-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here-- This file is automatically loaded by lazyvim.config.init


local map = vim.keymap.set

-- buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bP", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
map("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Delete buffer" })

-- prevent arrow navigation
map("n", "<up>", "<nop>", { silent = true })
map("n", "<down>", "<nop>", { silent = true })
map("n", "<left>", "<nop>", { silent = true })
map("n", "<right>", "<nop>", { silent = true })

-- terminal navigation
map("t", "<esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
