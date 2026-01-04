local function sonokaiStartUp()
  vim.cmd([[
      hi Comment cterm=italic
      let g:desert_hide_endofbuffer=1
      let g:desert_terminal_italics=1
      "let g:desert_termcolors=256
  
      "let base16colorspace=256
      "if filereadable(expand("~/.vimrc_background"))
      "  let base16colorspace=256          " Remove this line if not necessary
      "  source ~/.vimrc_background
      "endif
      "syntax on
      "colorscheme default
      "colorscheme desert
  
  
      " checks if your terminal has 24-bit color support
      if (has("termguicolors"))
      set termguicolors
      hi LineNr ctermbg=NONE guibg=NONE
      endif
  
      " The configuration options should be placed before `colorscheme sonokai`.
      let g:sonokai_style = 'default'
      let g:sonokai_enable_italic = 1
      let g:sonokai_disable_italic_comment = 1
  ]])
end

return {
  -- Load all theme plugins but don't apply them
  -- This ensures all colorschemes are available for hot-reloading
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/aether.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/ethereal.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/hackerman.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    lazy = true,
    priority = 1000,
  },
  {
    "kepano/flexoki-neovim",
    lazy = true,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "tahayvr/matteblack.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "sainnhe/sonokai",
    init = sonokaiStartUp,
    lazy = true,
    priority = 1000,
  },
}
