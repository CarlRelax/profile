--  TODO:
--
--  use lsp: cpp lua python
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		{ "mason-org/mason-lspconfig.nvim" },
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
		},
	},
	config = function()
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
