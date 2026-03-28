return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "saghen/blink.cmp",
    "nvim-mini/mini.icons",
    "folke/snacks.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    provider = "opencode",
    providers = {
      opencode = {
        name = "opencode",
      },
    },
    selector = {
      provider = "snacks",
    },
    input = {
      provider = "snacks",
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_add_current_file = true,
      enable_token_counting = true,
    },
    mappings = {
      --   ask = "<leader>aa",
      --   new_ask = "<leader>an",
      --   -- toggle = "<leader>at",
      --   edit = "<leader>ae",
      -- files = {
      --   add_current_buffer = "<leader>ab",
      --   add_all_buffers = "<leader>aB",
      -- },
      -- clear = "<leader>ac",
      --   toggle = {
      --     debug = "<leader>ad",
      --     selection = "<leader>aC",
      --     suggestion = "<leader>as",
      --     repomap = "<leader>aR",
      --   },
      --   sidebar = {
      --     next_prompt = "]p",
      --     prev_prompt = "[p",
      --     apply_all = "A",
      --     apply_cursor = "a",
      --     retry_user_request = "r",
      --     edit_user_request = "e",
      --     switch_windows = "<Tab>",
      --     reverse_switch_windows = "<S-Tab>",
      --     toggle_code_window = "x",
      --     remove_file = "d",
      --     add_file = "@",
      --     close = { "q", "<Esc>" },
      --   },
      --   diff = {
      --     ours = "co",
      --     theirs = "ct",
      --     all_theirs = "ca",
      --     both = "cb",
      --     cursor = "cc",
      --     next = "]x",
      --     prev = "[x",
      --   },
      --   suggestion = {
      --     accept = "<M-l>",
      --     next = "<M-]>",
      --     prev = "<M-[>",
      --     dismiss = "<C-]>",
      --   },
      --   submit = {
      --     normal = "<CR>",
      --     insert = "<C-s>",
      --   },
      --   cancel = {
      --     normal = { "<C-c>", "<Esc>", "q" },
      --     insert = { "<C-c>" },
      --   },
    },
    shortcuts = {
      {
        name = "refactor",
        description = "Refactor code with best practices",
        prompt = "Please refactor this code following best practices, improving readability and maintainability.",
      },
      {
        name = "explain",
        description = "Explain code",
        prompt = "Please explain this code in detail, including what it does and how it works.",
      },
      {
        name = "test",
        description = "Generate unit tests",
        prompt = "Please generate comprehensive unit tests for this code.",
      },
      {
        name = "debug",
        description = "Debug and fix issues",
        prompt = "Please analyze this code for bugs and provide fixes.",
      },
      {
        name = "docs",
        description = "Generate documentation",
        prompt = "Please generate documentation for this code.",
      },
    },
  },
  config = function(_, opts)
    require("avante").setup(opts)
  end,
}
