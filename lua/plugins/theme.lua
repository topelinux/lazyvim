return {
  {
    "sainnhe/sonokai",
    init = myStartUp,
    priority = 1000,
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
