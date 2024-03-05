require("telescope").setup({
        pickers = {
                find_files = {
                        hidden = true
                }
        },
        extensions = {
                ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                },
        },
})
require("telescope").load_extension("ui-select")
local telescoper = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", telescoper.find_files, {})
vim.keymap.set("n", "<leader>fg", telescoper.live_grep, {})

