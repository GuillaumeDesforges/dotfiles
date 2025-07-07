local gitsigns = require('gitsigns')

gitsigns.setup({
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts = vim.tbl_deep_extend("force", { buffer = bufnr }, opts)
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({ ']h', bang = true })
			else
				gitsigns.nav_hunk('next')
			end
		end, { desc = "Go to next git hunk" })

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({ '[h', bang = true })
			else
				gitsigns.nav_hunk('prev')
			end
		end, { desc = "Go to previous git hunk" })

		-- Actions
		map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = "Stage hunk" })
		map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = "Reset hunk" })

		map('v', '<leader>ghs', function()
			gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, { desc = "Stage hunk" })

		map('v', '<leader>ghr', function()
			gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, { desc = "Reset hunk" })

		map('n', '<leader>gbS', gitsigns.stage_buffer, { desc = "Stage buffer" })
		map('n', '<leader>gbR', gitsigns.reset_buffer, { desc = "Reset buffer" })
		map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = "Preview hunk" })
		map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = "Preview hunk" })

		map('n', '<leader>gb', function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame line" })

		map('n', '<leader>ghd', gitsigns.diffthis, { desc = "Diff hunk" })

		map('n', '<leader>ghD', function()
			gitsigns.diffthis('~')
		end, { desc = "Diff hunk+" })

		map('n', '<leader>ghQ', function() gitsigns.setqflist('all') end, { desc = "Quick fix (all)" })
		map('n', '<leader>ghq', gitsigns.setqflist, { desc = "Quick fix" })

		-- Toggles
		map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = "Current line blame" })
		map('n', '<leader>gtw', gitsigns.toggle_word_diff, { desc = "Word diff" })
	end
})
