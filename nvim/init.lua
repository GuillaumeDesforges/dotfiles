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
vim.opt.smartcase = true

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

vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end,
	{ desc = "Go to definition", noremap = true, silent = true })
vim.keymap.set('n', 'gy', function() require('telescope.builtin').lsp_type_definitions() end,
	{ desc = "Go to type definition", noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end,
	{ desc = "Go to reference", noremap = true, silent = true })
vim.keymap.set('n', 'gI', function() require('telescope.builtin').lsp_implementations() end,
	{ desc = "Go to implementation", noremap = true, silent = true })
vim.keymap.set('n', 'gD', function() require('telescope.builtin').diagnostics() end,
	{ desc = "Go to diagnostic", noremap = true, silent = true })
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

vim.keymap.set('n', ']h', function()
	require("gitsigns").nav_hunk('next')
end, { desc = "Go to next git hunk" })

vim.keymap.set('n', '[h', function()
	require("gitsigns").nav_hunk('prev')
end, { desc = "Go to previous git hunk" })

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

vim.keymap.set('n', '<leader>gly', '<cmd>GitLink<cr>', { desc = 'Yank link URL', silent = true })
vim.keymap.set('n', '<leader>glb', '<cmd>GitLink!<cr>', { desc = 'View in browser', silent = true })

vim.keymap.set('n', '<leader>ghs', require("gitsigns").stage_hunk, { desc = "Stage hunk" })
vim.keymap.set('n', '<leader>ghr', require("gitsigns").reset_hunk, { desc = "Reset hunk" })

vim.keymap.set('v', '<leader>ghs', function()
	require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "Stage hunk" })

vim.keymap.set('v', '<leader>ghr', function()
	require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "Reset hunk" })

vim.keymap.set('n', '<leader>gbS', require("gitsigns").stage_buffer, { desc = "Stage buffer" })
vim.keymap.set('n', '<leader>gbR', require("gitsigns").reset_buffer, { desc = "Reset buffer" })
vim.keymap.set('n', '<leader>ghp', require("gitsigns").preview_hunk, { desc = "Preview hunk" })
vim.keymap.set('n', '<leader>ghi', require("gitsigns").preview_hunk_inline, { desc = "Preview hunk" })

vim.keymap.set('n', '<leader>gB', function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })

vim.keymap.set('n', '<leader>ghd', require("gitsigns").diffthis, { desc = "Diff hunk" })

vim.keymap.set('n', '<leader>ghD', function()
	require("gitsigns").diffthis('~')
end, { desc = "Diff hunk+" })

vim.keymap.set('n', '<leader>ghQ', function() require("gitsigns").setqflist('all') end, { desc = "Quick fix (all)" })
vim.keymap.set('n', '<leader>ghq', require("gitsigns").setqflist, { desc = "Quick fix" })

-- Toggles
vim.keymap.set('n', '<leader>gtb', require("gitsigns").toggle_current_line_blame, { desc = "Current line blame" })
vim.keymap.set('n', '<leader>gtw', require("gitsigns").toggle_word_diff, { desc = "Word diff" })
