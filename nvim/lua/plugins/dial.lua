return {
  "monaqa/dial.nvim",
  lazy = "BufReadPost",
  opts = {},
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.constant.alias.Bool,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
      -- only_in_visual = {
      -- 	augend.integer.alias.decimal,
      -- 	augend.integer.alias.hex,
      -- 	augend.date.alias["%Y/%m/%d"],
      -- 	augend.constant.alias.bool,
      -- 	augend.constant.alias.Bool,
      -- 	augend.constant.alias.alpha,
      -- 	augend.constant.alias.Alpha,
      -- },
    })

    -- NOTE auto-increase/decrease
    local map = vim.keymap.set
    map("n", "<C-a>", function()
      require("dial.map").manipulate("increment", "normal")
    end)
    map("n", "<C-x>", function()
      require("dial.map").manipulate("decrement", "normal")
    end)
    map("n", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gnormal")
    end)
    map("n", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gnormal")
    end)
    map("x", "<C-a>", function()
      require("dial.map").manipulate("increment", "visual")
    end)
    map("x", "<C-x>", function()
      require("dial.map").manipulate("decrement", "visual")
    end)
    map("x", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gvisual")
    end)
    map("x", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gvisual")
    end)
  end,
}
