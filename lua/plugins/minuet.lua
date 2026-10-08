return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      local base_url = (os.getenv("AIGATE_BASE_URL") or "https://opencode.ai/zen/go") .. "/v1/chat/completions"
      local model = os.getenv("AIGATE_MODEL") or "deepseek-v4.1-flash"
      local session_id = "nvim-" .. os.time() .. "-" .. math.random(100000, 999999)
      --print("minuet: " .. model)
      require("minuet").setup({
        provider = "openai_compatible",
        request_timeout = 5,
        curl_extra_args = {
          "-H",
          "x-opencode-session: " .. session_id,
          "-H",
          "x-opencode-project: lazyvim",
        },
        provider_options = {
          codestral = {
            api_key = function()
              return "dummy"
            end,
          },
          openai_compatible = {
            api_key = function()
              return os.getenv("OPENCODE_API_KEY")
            end,
            end_point = base_url,
            stream = true,
            model = model,
            optional = {
              max_tokens = 2048,
              thinking = { type = "disabled" },
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
