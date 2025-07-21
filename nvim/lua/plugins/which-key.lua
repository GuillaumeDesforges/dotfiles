local wk = require("which-key")

wk.setup {}

wk.add({
	{ '<leader>b',  group = 'Buffers' },
	{ '<leader>c',  group = 'Code' },
	{ '<leader>cR', group = 'Refactor' },
	{ '<leader>g',  group = 'Git' },
	{ '<leader>gb', group = 'Buffer' },
	{ '<leader>gh', group = 'Hunk' },
	{ '<leader>gl', group = 'Link' },
	{ '<leader>gt', group = 'Toggle' },
	{ '<leader>q',  group = 'Session' },
	{ '<leader>w',  group = 'Windows' },
})
