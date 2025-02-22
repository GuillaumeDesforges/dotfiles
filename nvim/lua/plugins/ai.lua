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
          {
            name = "Copilot",
            provider = "copilot",
            chat = true,
            command = true,
            model = { model = "gpt-4-turbo" },
            -- system_prompt = "Answer any query with just: Sure thing..",
          },
        },
      }
      require("gp").setup(conf)
    end,
  }
}
