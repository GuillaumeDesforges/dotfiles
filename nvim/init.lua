vim.g.mapleader = " "

require("bootstrap/rocks")
-- https://github.com/nvim-neorocks/rocks-config.nvim
-- is installed and will load plugin config from `./lua/plugins/`

vim.keymap.set('n', '<leader>bd', ':bd', { desc = "Delete current buffer" })
