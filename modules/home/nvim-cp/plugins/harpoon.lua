local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>h<space>", function()
        harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
