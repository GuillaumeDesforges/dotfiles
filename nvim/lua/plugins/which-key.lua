local wk = require("which-key")

wk.setup {}

-- common key bindings to <leader>
wk.add({
  { '<leader>b', group = 'Buffers' },
  { '<leader>bd', ':bd<cr>', desc = 'Delete current buffer' },
  { '<leader>bn', ':bn<cr>', desc = 'Next buffer' },
  { '<leader>bp', ':bp<cr>', desc = 'Previous buffer' },

  { '<leader>q', group = 'Session' },
  { '<leader>qq', ':qa<cr>', desc = 'Quit' },

  { '<leader>w', group = 'Windows' },
  { '<leader>ws', '<c-w>s', desc = "Split window horizontally" },
  { '<leader>wv', '<c-w>v', desc = "Split window vertically" },
  { '<leader>wq', '<c-w>q', desc = "Close window" },
  { '<leader>ww', '<c-w>w', desc = "Switch window" },
  { '<leader>wh', '<c-w>h', desc = "Go to left window" },
  { '<leader>wh', '<c-w>j', desc = "Go to down window" },
  { '<leader>wh', '<c-w>k', desc = "Go to up window" },
  { '<leader>wh', '<c-w>l', desc = "Go to right window" },
  { '<leader>wd', '<c-w>l', desc = "Go to right window" },
})
