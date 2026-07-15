-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		git_ignored = true,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		adaptive_size = true,
	},
	git = {
		enable = true,
	},
	renderer = {
		icons = {
			show = {
				git = true,
			},
		},
	},
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = "Toggle tree" })
vim.keymap.set('n', '<leader>E', function()
	require("nvim-tree.api").tree.toggle_git_clean_filter()
end, { desc = "Toggle git-changes-only in tree" })
