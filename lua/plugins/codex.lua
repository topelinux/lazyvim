return {
  "ishiooon/codex.nvim",
  dependencies = { "folke/snacks.nvim" },
  init = function()
    print("hi in codex setup")
    require("codex").setup({
      terminal_cmd = "/Users/jieyang/Library/pnpm/codex",
    })
  end,
  keys = {
    { "<leader>xc", "<cmd>Codex<cr>", desc = "Codex: Toggle" },
    { "<leader>xf", "<cmd>CodexFocus<cr>", desc = "Codex: Focus" },
    { "<leader>xs", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: Send selection" },
    -- note: ftxfilter doesn’t work here (lazy.nvim keys doesn’t support it)
    { "<leader>xa", "<cmd>CodexTreeAdd<cr>", desc = "Codex: Add file" },
  },
}
