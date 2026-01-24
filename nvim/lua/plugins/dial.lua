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
        augend.hexcolor.new({
          case = "upper", -- or "lower", "prefer_upper", "prefer_lower", see below
        }),
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
  end,
}
