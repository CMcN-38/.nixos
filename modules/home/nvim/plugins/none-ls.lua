local null_ls = require("null-ls")
null_ls.setup({
        sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                --Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.diagnostics.ruff,
                -- Rust
                -- null_ls.builtins.formatting.rustfmt,
                --Nix
                null_ls.builtins.formatting.alejandra,
                null_ls.builtins.diagnostics.statix,
                -- null_ls.builtins.diagnostics.deadnix,

        },
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
