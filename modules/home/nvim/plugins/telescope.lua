vim.keymap.set("n", "<C-f>", telescope.builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.builtin.live_grep, {})
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
