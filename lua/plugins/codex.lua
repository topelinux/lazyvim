local session_id = "nvim-" .. os.time() .. "-" .. math.random(100000, 999999)

local function qwen_adapter(model)
  return require("codecompanion.adapters").extend("openai_compatible", {
    name = model,
    --formatted_name = "Qwen",
    formatted_name = "OpenCode " .. model,

    env = {
      url = os.getenv("AIGATE_BASE_URL") or "https://opencode.ai/zen/go",
      api_key = "OPENCODE_API_KEY",
      chat_url = "/v1/chat/completions",
      models_endpoint = "/v1/models",
    },
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = "Bearer ${api_key}",
      ["x-opencode-session"] = session_id,
      ["x-opencode-project"] = "lazyvim",
    },
    schema = {
      model = {
        default = model,
        choices = { model },
      },
      temperature = {
        default = 0.2,
      },
    },
  })
end

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
          deepseek_flash = function()
            return qwen_adapter("deepseek-v4.1-flash")
          end,
        },
      },

      interactions = {
        chat = {
          adapter = "deepseek_flash",
          keymaps = {
            send = {
              modes = {
                n = { "<CR>" },
                i = "<M-R>",
              },
            },
          },
        },
        cli = {
          agent = "codex",
          agents = {
            codex = {
              cmd = "codex",
              args = {},
              description = "OpenAI Codex CLI",
              provider = "terminal",
            },
            qwen = {
              cmd = "qwen",
              args = {},
              description = "qwen CLI",
              provider = "terminal",
            },
          },
        },
        inline = {
          adapter = "deepseek_flash",
        },
        cmd = {
          adapter = "deepseek_flash",
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
