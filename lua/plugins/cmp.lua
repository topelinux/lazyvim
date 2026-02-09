return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {
        "select_next",
        "accept",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
    },
  },
}
