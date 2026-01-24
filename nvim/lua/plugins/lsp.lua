return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  event = "BufReadPre",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "Snacks" },
            },
          },
        },
      },
      clangd = {},
      pyright = {},
    },
  },
  config = function(_, opts)
    local navbuddy = require("nvim-navbuddy")
    local navic = require("nvim-navic")
    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end
    for server, config in pairs(opts.servers) do
      vim.lsp.config[server] = {
        on_attach = on_attach,
      }
    end
    require("mason").setup()
    vim.diagnostic.config({
      virtual_text = true,
    })

    vim.lsp.enable({ "clangd", "lua_ls", "pyright" })
  end,
}
