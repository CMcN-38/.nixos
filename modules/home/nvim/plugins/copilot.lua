return {
        "github/copilot.vim",

        config = function()
                vim.keymap.set('i', '<C-Tab>', 'copilot#Accept("\\<CR>")', {
                        expr = true,
                        replace_keycodes = true
                })
                vim.g.copilot_no_tab_map = false
        end,
}

