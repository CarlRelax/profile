return {
	"gbprod/yanky.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{
			"<leader>y",
			function()
				Snacks.picker.yanky()
			end,
			mode = { "n", "x" },
			desc = "Open Yank History",
		},
	},
}
