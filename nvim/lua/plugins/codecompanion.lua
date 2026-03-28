return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    enabled = false,
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "opencode",
          },
          inline = {
            adapter = "opencode",
          },
        },
        adapters = {
          opencode = function()
            return require("codecompanion.adapters").extend("opencode", {
              name = "opencode",
              schema = {
                model = {
                  default = "opencode",
                },
              },
              env = {
                url = "http://localhost:13380",
              },
            })
          end,
        },
      })
    end,
  },
}

