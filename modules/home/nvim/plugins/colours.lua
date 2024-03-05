require("catppuccin").setup({
        flavour = "mocha",
})
vim.cmd.colorscheme("catppuccin")
--vim command for transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.opt.termguicolors = true
require("colorizer").setup()
