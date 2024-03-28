return {
  -- disable a few default mappings in favor of Copilot autocomplete
  {
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    keys = {
      -- removed in favor of Copilot
      { "<tab>", false, mode = "i" },
      { "<tab>", false, mode = "s" },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  -- setup Copilot suggestions
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
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
        markdown = false,
        yaml = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      -- supertab behavior: press tab to accept suggestion
      vim.keymap.set(
        "i", "<tab>",
        function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end,
        { silent = true, }
      )
    end,
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
  },
}
