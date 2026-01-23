return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl)
        hl.WinSeparator = {
          fg = "#c8a96a",
        }
        hl.StatusLine = { bg = "none" }
        hl.StatusLineNC = { bg = "none" }
        hl.TreesitterContext = { bg = "none" }
        hl.SignColumn = { fg = "#ff0000" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
      vim.cmd("highlight TreesitterContextBottom gui=underline guisp=Grey")
      vim.cmd("highlight BlinkCmpSource guibg=seaGreen")
    end,
  },
}
