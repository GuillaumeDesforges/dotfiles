local wk = require("which-key")

wk.setup {}

-- common key bindings to <leader>
wk.add({
	{ '<leader>b',  group = 'Buffers' },
	{ '<leader>bd', ':bd<cr>',        desc = 'Delete current buffer' },
	{ '<leader>bn', ':bn<cr>',        desc = 'Next buffer' },
	{ '<leader>bp', ':bp<cr>',        desc = 'Previous buffer' },
	{ '<s-l>',      ':bn<cr>',        desc = 'Next buffer' },
	{ '<s-h>',      ':bp<cr>',        desc = 'Previous buffer' },
})

wk.add({
	{ '<leader>q',  group = 'Session' },
	{ '<leader>qq', ':qa<cr>',        desc = 'Quit' },
})

wk.add({
	{ '<leader>w',  group = 'Windows' },
	{ '<leader>ws', '<c-w>s',         desc = "Split window horizontally" },
	{ '<leader>wv', '<c-w>v',         desc = "Split window vertically" },
	{ '<leader>wq', '<c-w>q',         desc = "Close window" },
	{ '<leader>wo', '<c-w>o',         desc = "Close other windows" },
	{ '<leader>ww', '<c-w>w',         desc = "Switch window" },
	{ '<leader>wh', '<c-w>h',         desc = "Go to left window" },
	{ '<leader>wh', '<c-w>j',         desc = "Go to down window" },
	{ '<leader>wh', '<c-w>k',         desc = "Go to up window" },
	{ '<leader>wh', '<c-w>l',         desc = "Go to right window" },
	{ '<leader>wd', '<c-w>l',         desc = "Go to right window" },
})

wk.add({
	{ '<leader>w',  group = 'Go to' },
	{ '<leader>gd', function() vim.lsp.buf.definition() end,                                                            desc = "Go to definition" },
	{ '<leader>gr', function() vim.lsp.buf.references() end,                                                            desc = "Go to references" },
	{ '<leader>ge', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end, desc = "Go to references" },
})

wk.add({
	{ ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,   desc = "Go to next error" },
	{ '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,   desc = "Go to previous error" },
	{ ']w', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING, wrap = true }) end, desc = "Go to next warning" },
	{ '[w', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING, wrap = true }) end, desc = "Go to previous warning" },
})
