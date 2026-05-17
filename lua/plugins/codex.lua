local function qwen_adapter(model)
  return require("codecompanion.adapters").extend("openai_compatible", {
    name = model,
    --formatted_name = "Qwen",
    formatted_name = "Qwen " .. model,

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
        default = model,
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
          qwen_plus = function()
            return qwen_adapter("qwen3.6-plus")
          end,
          qwen_coder = function()
            return qwen_adapter("qwen3-coder-plus")
          end,
          qwen_flash = function()
            return qwen_adapter("qwen3-coder-next")
          end,
        },
      },

      interactions = {
        chat = {
          adapter = "qwen_flash",
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
          adapter = "qwen_flash",
        },
        cmd = {
          adapter = "qwen_plus",
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
