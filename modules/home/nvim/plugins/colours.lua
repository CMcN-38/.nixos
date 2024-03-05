return {
	{
		"catppuccin/nvim",
		name = "catppuccin",

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
			vim.cmd.colorscheme("catppuccin")
                        --vim command for transparent background
                        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		name = "colorizer",
		config = function()
                        vim.opt.termguicolors = true
			require("colorizer").setup()
		end,
	},
}
