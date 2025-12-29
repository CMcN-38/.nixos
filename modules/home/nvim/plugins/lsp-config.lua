require("mason").setup()

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
end

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "jedi_language_server",
        "rust_analyzer",
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,

        -- 0.11-safe Lua config
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })
        end,
    },
})
