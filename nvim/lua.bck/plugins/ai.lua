return {
  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv("OPENAI_API_KEY"),
          },

          copilot = {
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
              "bash",
              "-c",
              "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
        },
        agents = {
          -- TODO: turn into a proper agent with a good prompt
          {
            name = "Copilot",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "gpt-4-turbo" },
            -- system_prompt = "Answer any query with just: Sure thing..",
            disable = true,
          },
        },
      }
      require("gp").setup(conf)
    end,
  },
  {
    "GeorgesAlkhouri/nvim-aider",
    dependencies = {
      "folke/snacks.nvim",
      -- optional
      "catppuccin/nvim",
      "nvim-tree/nvim-tree.lua",
      -- which-key integration
      {
        "folke/which-key.nvim",
        optional = true,
        opts = {
          spec = {
            { "<leader>a", group = "aider" },
          },
        },
      },
    },
    cmd = {
      "AiderTerminalToggle", "AiderHealth",
    },
    keys = {
      { "<leader>a/", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
      { "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
      { "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
      { "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
      { "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
      { "<leader>ar", "<cmd>AiderQuickReadOnlyFile<cr>", desc = "Add File as Read-Only" },
      { "<leader>a+", "<cmd>AiderTreeAddFile<cr>", desc = "Add File from Tree to Aider", ft = "NvimTree" },
      { "<leader>a-", "<cmd>AiderTreeDropFile<cr>", desc = "Drop File from Tree from Aider", ft = "NvimTree" },
    },
    config = true,
  }
}
