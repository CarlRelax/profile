return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  version = "*",
  dependencies = "nvim-mini/mini.icons",
  opts = {
    options = {
      indicator = {
        style = "underline",
      },
      -- separator_style = { '', '' },
      always_show_bufferline = true,
      themable = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local indicator = " "
        for level, number in pairs(diagnostics_dict) do
          local symbol
          if level == "error" then
            symbol = " "
          elseif level == "warning" then
            symbol = " "
          else
            symbol = " "
          end
          indicator = indicator .. symbol .. number
        end
        return indicator
      end,
    },
    -- highlights = {
    --   indicator_selected = {
    --     sp = "#ff9e64",
    --     bold = true,
    --   },
    --   tab_separator = { fg = "#ff9e64" },
    --   tab_separator_selected = { fg = "#ff9e64" },
    -- },
  },
  keys = {
    { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
    { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
    { "<leader>bd", ":bdelete<CR>", silent = true },
    { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
    { "<leader>bp", ":BufferLinePick<CR>", silent = true },
    { "<leader>bc", ":BufferLinePickClose<CR>", silent = true },
  },
}
