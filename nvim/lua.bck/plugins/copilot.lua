return {
  -- setup Copilot suggestions
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<c-a>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        -- enabled
        c = true,
        haskell = true,
        javascript = true,
        lua = true,
        python = true,
        scala = true,
        typescript = true,
        -- disabled
        json = false,
        markdown = false,
        yaml = false,
      },
    },
  },
  -- add 'copilot' component to lualine, see ./ui.lua
  { "AndreM222/copilot-lualine" },
  -- setup Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
  },
}
