local autocmd = vim.api.nvim_create_autocmd
-- print('autocmd')
autocmd("FileType", {
	pattern = { "cpp", "lua" },
	callback = function()
		-- print('innnnnnnnn')
		vim.treesitter.start()
		vim.lsp.enable({ "clangd", "lua_ls", "pyright" })
		-- vim.bo[args.buf].syntax = 'on'
	end,
})
