return {
        "preservim/tagbar",
        config = function()
                vim.keymap.set('n', '<leader>tb', ':TagbarToggle right<CR>', {})
        end
}
