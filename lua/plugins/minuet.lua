return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      local function has_tailscale()
        local handle = io.popen("ps aux 2>/dev/null | grep -qi '[T]ailscale' && echo 'ok'")
        if handle then
          local result = handle:read("*a"):gsub("%s+", "")
          handle:close()
          return result == "ok"
        end
        return false
      end

      local deepseek_enabled = has_tailscale()
      local base_url = deepseek_enabled and (os.getenv("DEEPSEEK_BASE_URL") or "http://192.168.31.220:8080")
        or (os.getenv("QWEN_BASE_URL") or "https://coding.dashscope.aliyuncs.com")

      base_url = base_url .. "/v1/chat/completions"
      local model = deepseek_enabled and (os.getenv("DEEPSEEK_MODEL") or "deepseek-v4-flash")
        or (os.getenv("QWEN_MODEL") or "qwen3-coder-next") -- 用 qwen-plus 更通用；你原设 qwen3-coder-next 也 OK
      local api_key = deepseek_enabled and "XUAN_DEEPSKEEY_KEY" or "QWEN_XUAN_API_KEY"
      --print("minuet: " .. model)
      require("minuet").setup({
        provider = "openai_compatible",
        request_timeout = 5,
        provider_options = {
          codestral = {
            api_key = function()
              return "dummy"
            end,
          },
          openai_compatible = {
            api_key = api_key,
            end_point = base_url,
            --end_point = (os.getenv("QWEN_URL") or "https://coding.dashscope.aliyuncs.com") .. "/v1/chat/completions",
            --end_point = "https://coding.dashscope.aliyuncs.com/v1/chat/completions",
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
