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
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },
}
