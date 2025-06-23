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

--
-- key bindings
--

vim.keymap.set('n', '<leader>qq', ':qa<cr>', { desc = 'Quit' })

vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<s-l>', ':bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<s-h>', ':bp<cr>', { desc = 'Previous buffer' })

vim.keymap.set('n', '<leader>ws', '<c-w>s', { desc = "Split window horizontally" })
vim.keymap.set('n', '<leader>wv', '<c-w>v', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>wq', '<c-w>q', { desc = "Close window" })
vim.keymap.set('n', '<leader>wo', '<c-w>o', { desc = "Close other windows" })
vim.keymap.set('n', '<leader>ww', '<c-w>w', { desc = "Switch window" })
vim.keymap.set('n', '<leader>wh', '<c-w>h', { desc = "Go to left window" })
vim.keymap.set('n', '<leader>wh', '<c-w>j', { desc = "Go to down window" })
vim.keymap.set('n', '<leader>wh', '<c-w>k', { desc = "Go to up window" })
vim.keymap.set('n', '<leader>wh', '<c-w>l', { desc = "Go to right window" })
vim.keymap.set('n', '<leader>wd', '<c-w>l', { desc = "Go to right window" })

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set('n', 'gy', function() vim.lsp.buf.type_definition() end, { desc = "Go to type definition" })
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { desc = "Go to references" })

vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>gy', function() vim.lsp.buf.type_definition() end, { desc = "Go to type definition" })
vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, { desc = "Go to references" })
vim.keymap.set('n', '<leader>ge',
	function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,
	{ desc = "Go to next error" }
)
vim.keymap.set('n', ']e',
	function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,
	{ desc = "Go to next error" }
)
vim.keymap.set('n', '[e',
	function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,
	{ desc = "Go to previous error" }
)
vim.keymap.set('n', ']w',
	function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, wrap = true }) end,
	{ desc = "Go to next warning" }
)
vim.keymap.set('n', '[w',
	function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, wrap = true }) end,
	{ desc = "Go to previous warning" }
)

