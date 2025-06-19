require("trouble").setup()

require("which-key").add({
  { '<leader>x', group = 'Trouble' },
  { '<leader>xx', ':Trouble diagnostics toggle<cr>', desc = 'Open diagnostics' },
})
