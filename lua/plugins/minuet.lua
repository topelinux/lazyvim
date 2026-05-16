return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_compatible",
        request_timeout = 5,
        provider_options = {
          openai_compatible = {
            api_key = "QWEN_XUAN_API_KEY",
            end_point = (os.getenv("QWEN_URL") or "https://coding.dashscope.aliyuncs.com") .. "/v1/chat/completions",

            --end_point = "http://192.168.31.220:8080/v1/chat/completions",
            --end_point = "https://coding.dashscope.aliyuncs.com/v1/chat/completions",
            stream = true,
            model = "qwen3-coder-next",
            optional = {
              max_tokens = 255,
            },
          },
          --openai_compatible = {
          --  api_key = "DEEPSEEK_API_KEY",
          --  base_url = "https://api.deepseek.com/v1", -- 关键
          --  model = "deepseek-v4-flash",
          --  optional = {
          --    max_tokens = 256,
          --    top_p = 0.9,
          --  },
          --},
          openai_fim_compatible = {
            model = "mercury-coder",
            end_point = "https://api.inceptionlabs.ai/v1/fim/completions",
            api_key = "INCEPTION_API_KEY", -- environment variable name
            stream = true,
          },
        },
      })
    end,
  },
  -- optional, if you are using virtual-text frontend, nvim-cmp is not
  -- required.
  { "hrsh7th/nvim-cmp" },
  -- optional, if you are using virtual-text frontend, blink is not required.
  { "Saghen/blink.cmp" },

  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}

      -- 手动触发 minuet
      opts.keymap["<A-a>"] = require("minuet").make_blink_map()

      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default
        or {
          "lsp",
          "path",
          "snippets",
          "buffer",
        }

      -- 加入 minuet 到补全源
      table.insert(opts.sources.default, "minuet")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.minuet = {
        name = "minuet",
        module = "minuet.blink",
        async = true,
        timeout_ms = 3000,
        score_offset = 50,
      }

      opts.completion = opts.completion or {}
      opts.completion.trigger = opts.completion.trigger or {}
      opts.completion.trigger.prefetch_on_insert = false
    end,
  },
}
