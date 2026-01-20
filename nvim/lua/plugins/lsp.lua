--  TODO:
--
--  use lsp: cpp lua python
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
  event = "VeryLazy",
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
      -- clangd = {
      --   on_attach = function(client, bufnr)
      --     require("nvim-navic").attach(client, bufnr)
      --   end,
      -- },
    },
  },
  config = function()
    local navbuddy = require("nvim-navbuddy")
    local navic = require("nvim-navic")
    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end
    require("mason").setup()
    -- vim.lsp.config['clangd'] = {
    --   cmd = { 'clangd' },
    --   -- filetypes = { 'cpp', 'c', 'h'},
    -- }
    -- vim.lsp.config['lua-language-server'] = {
    --   cmd = { ''}
    -- }
    -- vim.lsp.enable('clangd')
    vim.diagnostic.config({
      virtual_text = true,
    })
    -- local navic = require("nvim-navic")
    -- require("lspconfig").lua_ls.setup({
    --   on_attach = on_attach,
    -- })
    -- require("lspconfig").pyright.setup({
    --   on_attach = on_attach,
    -- })
    vim.lsp.config["lua_ls"] = {
      on_attach = on_attach,
    }
    vim.lsp.config["pyright"] = {
      on_attach = on_attach,
    }
    vim.lsp.config["clangd"] = {
      on_attach = on_attach,
    }
    -- vim.lsp.config("lus_ls", {
    --   on_attach = on_attach,
    -- function(client, bufnr)
    --   navic.attach(client, bufnr)
    -- end,
    -- })
    vim.lsp.enable({ "clangd", "lua_ls", "pyright" })
  end,
  --    setup = {},
  -- config = function(_, opts)
  --   require("mason").setup(opts)
  --   local registry = require "mason-registry"
  --
  --   local success, package = pcall(registry.get_package, "lua-language-server")
  --   if success and not package:is_installed() then
  --     package:install()
  --   end
  --
  --   local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig["lua-language-server"]
  --   vim.lsp.config(nvim_lsp, {})
  --
  --   vim.cmd("LspStart")
  -- end,
}
