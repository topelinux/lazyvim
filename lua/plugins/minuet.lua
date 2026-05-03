return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        provider_options = {
          openai_compatible = {
            api_key = "DEEPSEEK_API_KEY",
            base_url = "https://api.deepseek.com/v1", -- 关键
            model = "deepseek-v4-flash",
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
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
      --table.insert(opts.sources.default, "minuet")

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
