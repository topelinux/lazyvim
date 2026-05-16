return {
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
      "CodeCompanionCmd",
      "CodeCompanionCLI",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        http = {
          qwen = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "qwen",
              formatted_name = "Qwen",
              env = {
                url = os.getenv("QWEN_URL") or "https://coding.dashscope.aliyuncs.com",
                api_key = "QWEN_XUAN_API_KEY",
                chat_url = "/v1/chat/completions",
              },
              headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer ${api_key}",
              },
              schema = {
                model = {
                  default = "qwen3-coder-next",
                  choices = {
                    "qwen3.6-plus",
                    "qwen3-coder-next",
                    "qwen3-coder-plus",
                    "qwen3-coder-flash",
                    "qwen-plus",
                    "qwen-flash",
                  },
                },
                temperature = {
                  default = 0.2,
                },
              },
            })
          end,
        },
      },

      interactions = {
        chat = {
          adapter = "qwen",
          keymaps = {
            send = {
              modes = {
                n = { "<CR>" },
                i = "<M-R>",
              },
            },
          },
        },
        inline = {
          adapter = "qwen",
        },
        cmd = {
          adapter = "qwen",
        },
      },

      opts = {
        language = "Chinese",
      },
    },

    keys = {
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        desc = "CodeCompanion Actions",
      },
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "CodeCompanion Chat",
      },
      {
        "<leader>ai",
        "<cmd>CodeCompanion<cr>",
        mode = { "n", "v" },
        desc = "CodeCompanion Inline",
      },
    },
  },
}
