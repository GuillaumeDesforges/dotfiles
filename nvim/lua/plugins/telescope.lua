require("telescope").setup()

require("which-key").add({
  { '<leader>/', ':Telescope live_grep<cr>', desc = 'Live grep' },

  { '<leader>f', group = 'Find' },
  { '<leader>ff', ':Telescope find_files<cr>', desc = 'Find files' },
  { '<leader>fb', ':Telescope buffers<cr>', desc = 'Find files' },
  { '<leader>fj', ':Telescope jumplist<cr>', desc = 'Find jump' },
  { '<leader>fr', ':Telescope oldfiles<cr>', desc = 'Find recent file' },
})
