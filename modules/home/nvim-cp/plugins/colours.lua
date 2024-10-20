require("ir_black").setup({
})
vim.cmd.colorscheme("ir_black")
--vim command for transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.opt.termguicolors = true
