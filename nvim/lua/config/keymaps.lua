local map = vim.keymap.set

-- NOTE windows
map("n", "<leader>w", "<C-W>", { desc = "Window Settings", silent = true, noremap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Horizontal", silent = true, noremap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Vertical", silent = true, noremap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Current Window", silent = true, noremap = true })

-- NOTE Move Lines
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

-- NOTE quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All", silent = true, noremap = true })

-- NOTE save
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File", silent = true, noremap = true })
map("i", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File", silent = true, noremap = true })

map({ "n", "i" }, "<leader>o", "<cmd>Oil --float --preview<cr>", { desc = "Open Oil", silent = true, noremap = true })

map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy Dashboard", silent = true, noremap = true })
map("n", "<leader>m", ":Mason<cr>", { desc = "Open Mason Dashboard", silent = true, noremap = true })

map("i", "jk", "<esc>", { desc = "Exit Current Mode To Normal Mode", silent = true, noremap = true })

-- NOTE buffers
map("n", "<A-l>", ":bnext<cr>", { desc = "Switch To Next Buffer", silent = true, noremap = true })
map("n", "<A-h>", ":bprev<cr>", { desc = "Switch To Last Buffer", silent = true, noremap = true })

-- NOTE persistence
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

-- NOTE cancel search highlight
map("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end, { silent = true })

-- NOTE lsp
map("n", "<leader>cn", function()
  require("nvim-navbuddy").open()
end, { desc = "Open NavBuddy", silent = true })

-- NOTE diagnostic
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

-- NOTE tabs
map("n", "]T", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "[T", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

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
