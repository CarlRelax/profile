return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "lua", "cpp" },
      auto_install = true,
      sync_install = false,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = {},
        -- disable = function(lang, buf)
        -- 	return vim.api.nvim_buf_line_count(buf) > 5000
        -- end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = {
          "python",
          "yaml",
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<CR>",
          scope_incremental = "<TAB>",
        },
      },
    },
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter-textobjects",
  -- 	event = "VeryLazy",
  -- 	branch = "main",
  -- 	version = false,
  -- 	dependencies = {
  -- 		"nvim-treesitter/nvim-treesitter",
  -- 	},
  -- 	config = function()
  -- 		require("nvim-treesitter.config").setup({
  -- 			textobjects = {
  -- 				select = {
  -- 					enable = true,
  -- 					lookahead = true,
  -- 					selection_modes = {
  -- 						["@parameter.outer"] = "v",
  -- 						["@function.outer"] = "V",
  -- 						["@class.outer"] = "<c-v>",
  -- 					},
  -- 					include_surrounding_whiterspace = false,
  -- 				},
  -- 				move = {
  -- 					enable = true,
  -- 					set_jumps = true,
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },
}
