return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
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
        markdown = false,
        yaml = false,
      },
    },
    keys = {
      -- map Tab in insert mode to accept copilot suggestion
      {
        "<tab>",
        mode = { "i" },
        function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end,
        desc = "i-mode Tab with copilot accept",
      },
    },
  },
  -- add 'copilot' component to lualine
  { "AndreM222/copilot-lualine" },
  -- add Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
