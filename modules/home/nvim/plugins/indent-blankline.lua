return {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
                
        },
        config = function()
                require("ibl").setup{
                        exclude = {filetypes = {"dashboard", "Neotree", "lazy"}, buftypes = {"terminal"} },
                        indent = {char = "│"},
                        whitespace = { highlight = {"Whitespace", "NonText"} },
                }
        end
}
