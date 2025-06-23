local wk = require("which-key")

wk.setup {}

wk.add({
	{ '<leader>b', group = 'Buffers' },
	{ '<leader>c', group = 'Code' },
	{ '<leader>g', group = 'Go to' },
	{ '<leader>q', group = 'Session' },
	{ '<leader>w', group = 'Windows' },
})
