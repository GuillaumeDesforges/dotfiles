-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		adaptive_size = true,
	},
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = "Toggle tree" })
