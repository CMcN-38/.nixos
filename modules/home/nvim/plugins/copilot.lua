vim.keymap.set('i', 'C-a', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = true
})
vim.g.copilot_no_tab_map = true
vim.keymap.set('n', '<leader>cpe', ':Copilot enable<CR>')
vim.keymap.set('n', '<leader>cpd', ':Copilot disable<CR>')


 
