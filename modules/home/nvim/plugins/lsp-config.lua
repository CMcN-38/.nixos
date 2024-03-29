require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = {
                "lua_ls",
                "jedi_language_server",
                "rust_analyzer",
        },
        handlers = {
                function (server_name)
                        require("lspconfig")[server_name].setup {}
                end,
        }
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
        capabilities = capabilities
})
lspconfig.jedi_language_server.setup({
        capabilities = capabilities
})
lspconfig.rust_analyzer.setup({
        capabilities = capabilities
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
