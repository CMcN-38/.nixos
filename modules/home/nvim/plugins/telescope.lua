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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

