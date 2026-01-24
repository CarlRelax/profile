return {
  {
    "nvim-mini/mini.ai",
    event = "BufReadPost",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
      "nvim-treesitter/nvim-treesitter",
    },
    version = "*",
    branch = "main",
    opts = function()
      local spec_treesitter = require("mini.ai").gen_spec.treesitter
      return {
        n_lines = 500,
        custom_textobjects = {
          b = spec_treesitter({
            a = { "@block.outer" },
            i = { "@block.inner" },
          }),
          o = spec_treesitter({
            a = { "@loop.outer" },
            i = { "@loop.inner" },
          }),
          i = spec_treesitter({
            a = { "@conditional.outer" },
            i = { "@conditional.inner" },
          }),
          f = spec_treesitter({
            a = "@function.outer",
            i = "@function.inner",
          }),
          c = spec_treesitter({
            a = "@class.outer",
            i = "@class.inner",
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    -- config = function()
    --   require("mini.icons").setup(_, opts)
    -- end,
  },
  {
    "nvim-mini/mini.hipatterns",
    event = "BufReadPost",
    version = false,
    enabled = false,
    opts = {},
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
  {
    "nvim-mini/mini.surround",
    event = "BufReadPost",
    config = function()
      require("mini.surround").setup({
        n_lines = 100,
        mappings = {
          add = "\\a", -- Add surrounding in Normal and Visual modes
          delete = "\\d", -- Delete surrounding
          find = "\\f", -- Find surrounding (to the right)
          find_left = "\\F", -- Find surrounding (to the left)
          highlight = "\\h", -- Highlight surrounding
          replace = "\\r", -- Replace surrounding

          suffix_last = "[",
          suffix_next = "]",
        },
      })
    end,
  },
}
