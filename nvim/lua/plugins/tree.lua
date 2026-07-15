-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', '<leader>g', api.tree.toggle_git_clean_filter,
		{ buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "Toggle git-changes-only" })
end

require("nvim-tree").setup({
	on_attach = on_attach,
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
