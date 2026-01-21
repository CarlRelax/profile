-- local opts = { noremap = true, silent = true }

local map = vim.keymap.set
-- windows
map("n", "<leader>w", "<C-W>", { desc = "Window Settings", silent = true, noremap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Horizontal", silent = true, noremap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Vertical", silent = true, noremap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Current Window", silent = true, noremap = true })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down", silent = true, noremap = true })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up", silent = true, noremap = true })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true, noremap = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up", silent = true, noremap = true })
map(
  "v",
  "<A-j>",
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  { desc = "Move Down", silent = true, noremap = true }
)
map(
  "v",
  "<A-k>",
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  { desc = "Move Up", silent = true, noremap = true }
)

-- TS-Context
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Go To Context [TS context]", silent = true })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All", silent = true, noremap = true })

-- save
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File", silent = true, noremap = true })
map("i", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File", silent = true, noremap = true })

map({ "n", "i" }, "<leader>o", "<cmd>Oil --float --preview<cr>", { desc = "Open Oil", silent = true, noremap = true })
-- map("i", "<leader>e", "<cmd>Oil --float<cr>", { desc = "Open Oil", silent = true, noremap = true })

-- map("n", "<leader>qb", ":bdelete<cr>", { desc = "Close Current Buffer", silent = true, noremap = true }) -- delete buffer and close window showing the buffer
-- map("n", "<leader>qw", "<C-W>c", { desc = "Close Current Window", silent = true, noremap = true })

map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy Dashboard", silent = true, noremap = true })
map("n", "<leader>m", ":Mason<cr>", { desc = "Open Mason Dashboard", silent = true, noremap = true })

map("i", "jk", "<esc>", { desc = "Exit Current Mode To Normal Mode", silent = true, noremap = true })
-- map("v", "jk", "<esc>", { desc = "Exit Current Mode To Normal Mode" })

-- buffers
map("n", "<A-l>", ":bnext<cr>", { desc = "Switch To Next Buffer", silent = true, noremap = true })
map("n", "<A-h>", ":bprev<cr>", { desc = "Switch To Last Buffer", silent = true, noremap = true })

-- auto-increase/decrease
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
-- Yanky
--map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
--map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
--map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
--map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
--
-- persistence
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Load Current Session" }) -- load the session for the current directory
map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select Session" }) -- select a session to load
map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Load Last Session" }) -- load the last session
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Quit Without Session" }) -- stop Persistence => session won't be saved on exit
-- cancel search highlight
map("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end, { silent = true })
-- lsp
map("n", "<leader>cn", function()
  require("nvim-navbuddy").open()
end, { desc = "Open NavBuddy", silent = true })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- tabs
map("n", "]T", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "[T", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- DAP
map("n", "<F5>", require("dap").continue, { desc = "DAP Continue" })
map("n", "<F6>", require("dap").step_over, { desc = "DAP Step Over" })
map("n", "<F7>", require("dap").step_into, { desc = "DAP Step Into" })
map("n", "<F8>", require("dap").step_out, { desc = "DAP Step Out" })

map("n", "<Leader>db", require("dap").toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
map("n", "<Leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

map("n", "<Leader>dr", require("dap").repl.open, { desc = "DAP REPL" })
map("n", "<Leader>dl", require("dap").run_last, { desc = "DAP Run Last" })

-- NOTE for test
-- map("n", "<leader>t", function()
--   Snacks.input({ prompt = "macro register (single lowercase letters only)" }, function(value)
--     if value:match("^%[a-z]$") ~= nil then
--       print(value)
--     else
--       Snacks.notify.error("single lowercase letters only")
--     end
--   end)
-- end, { desc = "test record", silent = true })
-- treesitter-textobjects
-- selection
-- map({"x","o"}, "af", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
-- end, { desc = "Select around function", silent = true, noremap = true })
-- map({"x","o"}, "if", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
-- end, { desc = "Select inner function", silent = true, noremap = true })
-- map({"x","o"}, "ac", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
-- end, { desc = "Select around class", silent = true, noremap = true })
-- map({"x","o"}, "ic", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
-- end, { desc = "Select inner class", silent = true, noremap = true })
-- map({"x","o"}, "ai", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
-- end, { desc = "Select around condition", silent = true, noremap = true })
-- map({"x","o"}, "ii", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
-- end, { desc = "Select inner condition", silent = true, noremap = true })
-- map({"x","o"}, "al", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
-- end, { desc = "Select around loop", silent = true, noremap = true })
-- map({"x","o"}, "il", function()
--   require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
-- end, { desc = "Select inner loop", silent = true, noremap = true })
-- -- swap
-- map("n", "<leader>j", function()
--   require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
-- end, { desc = "Swap With Next Param", silent = true, noremap = true })
-- map("n", "<leader>k", function()
--   require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
-- end, { desc = "Swap With Previous Param", silent = true, noremap = true })
-- -- move
-- -- loop
-- map({"n","x","o"}, "]ls", function()
--   require "nvim-treesitter-textobjects.move".goto_next_start({"@loop.outer", "@loop.inner"}, "textobjects")
-- end, { desc = "Go To Next Loop Start", silent = true, noremap = true })
-- map({"n","x","o"}, "]le", function()
--   require "nvim-treesitter-textobjects.move".goto_next_end({"@loop.outer", "@loop.inner"}, "textobjects")
-- end, { desc = "Go To Next Loop End", silent = true, noremap = true })
-- map({"n","x","o"}, "[ls", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_start({"@loop.outer", "@loop.inner"}, "textobjects")
-- end, { desc = "Go To Last Loop Start", silent = true, noremap = true })
-- map({"n","x","o"}, "[le", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_end({"@loop.outer", "@loop.inner"}, "textobjects")
-- end, { desc = "Go To Last Loop End", silent = true, noremap = true })
-- -- function
-- map({"n","x","o"}, "]fs", function()
--   require "nvim-treesitter-textobjects.move".goto_next_start("@function.outer", "textobjects")
-- end, { desc = "Go To Next Function Start", silent = true, noremap = true })
-- map({"n","x","o"}, "]fe", function()
--   require "nvim-treesitter-textobjects.move".goto_next_end("@function.outer", "textobjects")
-- end, { desc = "Go To Next Function End", silent = true, noremap = true })
-- map({"n","x","o"}, "[fs", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_start("@function.outer", "textobjects")
-- end, { desc = "Go To Last Function Start", silent = true, noremap = true })
-- map({"n","x","o"}, "[fe", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_end("@function.outer", "textobjects")
-- end, { desc = "Go To Last Function End", silent = true, noremap = true })
-- -- class
-- map({"n","x","o"}, "]cs", function()
--   require "nvim-treesitter-textobjects.move".goto_next_start("@class.outer", "textobjects")
-- end, { desc = "Go To Next Class Start", silent = true, noremap = true })
-- map({"n","x","o"}, "]ce", function()
--   require "nvim-treesitter-textobjects.move".goto_next_end("@class.outer", "textobjects")
-- end, { desc = "Go To Next Class End", silent = true, noremap = true })
-- map({"n","x","o"}, "[cs", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_start("@class.outer", "textobjects")
-- end, { desc = "Go To Last Class Start", silent = true, noremap = true })
-- map({"n","x","o"}, "[ce", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_end("@class.outer", "textobjects")
-- end, { desc = "Go To Last Class End", silent = true, noremap = true })
-- -- condition
-- map({"n","x","o"}, "]is", function()
--   require "nvim-treesitter-textobjects.move".goto_next_start("@conditional.outer", "textobjects")
-- end, { desc = "Go To Next Condition Start", silent = true, noremap = true })
-- map({"n","x","o"}, "]ie", function()
--   require "nvim-treesitter-textobjects.move".goto_next_end("@conditional.outer", "textobjects")
-- end, { desc = "Go To Next Condition End", silent = true, noremap = true })
-- map({"n","x","o"}, "[is", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_start("@conditional.outer", "textobjects")
-- end, { desc = "Go To Last Condition Start", silent = true, noremap = true })
-- map({"n","x","o"}, "[ie", function()
--   require "nvim-treesitter-textobjects.move".goto_previous_end("@conditional.outer", "textobjects")
-- end, { desc = "Go To Last Condition End", silent = true, noremap = true })
-- map({"n","x","o"}, "il", function()
--   require "nvim-treesitter-textobjects.move".goto_next_start("textobjects", "@loop.inner")
-- end, { desc = "Select inner loop", silent = true, noremap = true })
