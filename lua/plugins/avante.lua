return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      provider = "aliyuncs",
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          max_tokens = 8192,
        },
        aliyuncs = {
          __inherited_from = "openai",
          api_key_name = "DASHSCOPE_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen3-coder-plus", -- your desired model (or use gpt-4o, etc.)
          max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        },
      },
      enable_auto_complete = true,
      mappings = {
        submit = {
          normal = "<CR>",
          insert = "<leader>s",
        },
      },
    },
  },
}
