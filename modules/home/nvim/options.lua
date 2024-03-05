-- COLORS
vim.cmd('syntax on')
vim.cmd('highlight LineNr ctermfg=grey')

-- BASICS
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.smarttab = true
vim.o.scrolloff = 25
vim.o.clipboard = 'unnamed'
vim.o.mouse = ""

--KEYMAPS
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
map('n', '<C-t>', ':silent !tmux neww tmux-sessioniser<CR>', {noremap = true, silent = true})

