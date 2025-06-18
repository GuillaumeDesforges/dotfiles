local wk = require("which-key")

wk.setup {}
wk.add({
  { '<leader>b', group = 'Buffers' },
  { '<leader>bd', ':bd<cr>', desc = 'Delete current buffer' },
  { '<leader>bn', ':bn<cr>', desc = 'Next buffer' },
  { '<leader>bp', ':bp<cr>', desc = 'Previous buffer' },

  { '<leader>q', group = 'Session' },
  { '<leader>qq', ':qa<cr>', desc = 'Quit' },
})
