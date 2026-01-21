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
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = true, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = "",
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        -- on_attach = function(bufnr)
        --   local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
        --   if ft ~= "help" then
        --     return false
        --   end
        -- end,
      })
    end,
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup({
        highlight = true,
        separator = " > ",
        depth = 3,
        lsp = {
          auto_attach = true,
        },
        click = true,
      })
    end,
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
