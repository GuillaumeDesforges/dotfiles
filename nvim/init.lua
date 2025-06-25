-- system
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
-- ui
vim.opt.number = true
vim.opt.relativenumber = true
-- editor
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.breakindent = true

-- plugins
require("bootstrap/rocks")

-- plugin configs in `./lua/plugins/` are loaded by rocks-configs

--
-- key bindings
--

vim.g.mapleader = " "

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = 'Stop highlighting search results' })

vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit Neovim' })
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = 'Open last session (cwd)' })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = 'List sessions' })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
	{ desc = 'Open last session' })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = 'Quit without saving session' })

vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
vim.keymap.set('n', '<s-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<s-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })

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
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { desc = "Go to reference" })
vim.keymap.set('n', 'gI', function() vim.lsp.buf.implementation() end, { desc = "Go to implementation" })
vim.keymap.set('n', 'ge',
	function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true }) end,
	{ desc = "Go to next error" }
)
vim.keymap.set('n', 'gw',
	function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, wrap = true }) end,
	{ desc = "Go to next warning" }
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

vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		-- If the terminal window is lazygit, we do not make changes to avoid clashes
		if string.find(vim.api.nvim_buf_get_name(0), "lazygit") then
			return
		end

		vim.keymap.set("t", "<ESC>", function()
			vim.cmd("stopinsert")
		end, { buffer = true })
	end,
})

vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end, { desc = "Rename symbol" })

vim.keymap.set('v', "<leader>cRe", function() require("refactoring").refactor("Extract Function") end,
	{ desc = "Extract function", })
vim.keymap.set('v', "<leader>cRf", function() require("refactoring").refactor("Extract Function To File") end,
	{ desc = "Extract function to file" })
vim.keymap.set('v', "<leader>cRv", function() require("refactoring").refactor("Extract Variable") end,
	{ desc = "Extract variable" })
vim.keymap.set('n', "<leader>cRI", function() require("refactoring").refactor("Inline Function") end,
	{ desc = "Inline function" })
vim.keymap.set('n', "<leader>cRi", function() require("refactoring").refactor("Inline Variable") end,
	{ desc = "Inline Variable" })

vim.keymap.set('n', "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit", silent = true })
vim.keymap.set('n', '<leader>gY', '<cmd>GitLink<cr>', { desc = 'Yank link URL', silent = true })
vim.keymap.set('n', '<leader>gb', '<cmd>GitLink!<cr>', { desc = 'View in browser', silent = true })
