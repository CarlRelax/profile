return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    lazygit = {},
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
    -- zen = {},
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files [Snacks]",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers [Snacks]",
    },
    -- {
    --   "<leader>:",
    --   function()
    --     Snacks.picker.command_history()
    --   end,
    --   desc = "Command History [Snacks]",
    -- },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History [Snacks]",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer [Snacks]",
    },
    -- find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers [Snacks]",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File [Snacks]",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files [Snacks]",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files [Snacks]",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects [Snacks]",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent [Snacks]",
    },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches [Snacks]",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log [Snacks]",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line [Snacks]",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status [Snacks]",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash [Snacks]",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks) [Snacks]",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File [Snacks]",
    },
    -- gh
    -- {
    --   "<leader>gi",
    --   function()
    --     Snacks.picker.gh_issue()
    --   end,
    --   desc = "GitHub Issues (open)",
    -- },
    -- {
    --   "<leader>gI",
    --   function()
    --     Snacks.picker.gh_issue({ state = "all" })
    --   end,
    --   desc = "GitHub Issues (all)",
    -- },
    -- {
    --   "<leader>gp",
    --   function()
    --     Snacks.picker.gh_pr()
    --   end,
    --   desc = "GitHub Pull Requests (open)",
    -- },
    -- {
    --   "<leader>gP",
    --   function()
    --     Snacks.picker.gh_pr({ state = "all" })
    --   end,
    --   desc = "GitHub Pull Requests (all)",
    -- },
    -- Grep
    {
      "<leader>sl",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines [Snacks]",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers [Snacks]",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep [Snacks]",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word [Snacks]",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers [Snacks]",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History [Snacks]",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines [Snacks]",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History [Snacks]",
    },
    -- {
    --   "<leader>sC",
    --   function()
    --     Snacks.picker.commands()
    --   end,
    --   desc = "Commands",
    -- },
    -- {
    --   "<leader>sd",
    --   function()
    --     Snacks.picker.diagnostics()
    --   end,
    --   desc = "Diagnostics",
    -- },
    -- {
    --   "<leader>sD",
    --   function()
    --     Snacks.picker.diagnostics_buffer()
    --   end,
    --   desc = "Buffer Diagnostics",
    -- },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages [Snacks]",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights [Snacks]",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons [Snacks]",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps [Snacks]",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sL",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List [Snacks]",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages [Snacks]",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec [Snacks]",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List [Snacks]",
    },
    -- {
    --   "<leader>sR",
    --   function()
    --     Snacks.picker.resume()
    --   end,
    --   desc = "Resume",
    -- },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History [Snacks]",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes [Snacks]",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition [Snacks]",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration [Snacks]",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References [Snacks]",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation [Snacks]",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition [Snacks]",
    },
    {
      "gai",
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = "C[a]lls Incoming",
    },
    {
      "gao",
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = "C[a]lls Outgoing",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    -- {
    --   "<leader>sS",
    --   function()
    --     Snacks.picker.lsp_workspace_symbols()
    --   end,
    --   desc = "LSP Workspace Symbols",
    -- },
    -- Other
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode [Snacks]",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom [Snacks]",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer [Snacks]",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer [Snacks]",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History [Snacks]",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer [Snacks]",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse [Snacks]",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit [Snacks]",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications [Snacks]",
    },
    {
      "<c-`>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal [Snacks]",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference [Snacks]",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference [Snacks]",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "Neovim News [Snacks]",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
