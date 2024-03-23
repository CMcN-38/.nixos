-- COLORS
-- enable syntax highlighting
vim.cmd('syntax on')
-- change the color of the line numbers
vim.cmd('highlight LineNr ctermfg=grey')
-- enable nerd font
vim.g.have_nerd_font = true

-- BASICS
-- enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true
-- hide the mode as it is in the statusline
vim.o.showmode = false

-- indent and tab settings
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.smarttab = true

-- minimum number of lines to keep above and below the cursor
vim.o.scrolloff = 25
-- disable to keep the system keyboard independent
vim.o.clipboard = 'unnamedplus'
-- save undo history
vim.opt.undofile = true
-- change to "a" to enable mouse "" to disable
vim.o.mouse = ""

-- timeout for which-key
vim.o.timeout = true
vim.o.timeoutlen = 800

--KEYMAPS
-- set leader key, must be done before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap

-- create a new tmux session with tmux sessioniser
map('n', '<C-t>', ':silent !tmux neww tmux-sessioniser<CR>', {noremap = true, silent = true})

-- Set highlight on search but clear on pressing Esc in normal mode
vim.o.hlsearch = true
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j"<CR>')


-- HIGHLIGHT ON YANK
vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight on yank',
        group = vim.api.nvim_create_augroup('HighlightOnYank', { clear = true }),
        callback = function()
                vim.highlight.on_yank()
        end,
})

