return {
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "javascript",
                "json",
                "lua",
                "python",
                "typescript",
                "tsx",
                "css",
                "rust",
                "java",
                "yaml",
                "markdown",
                "markdown_inline",
                "html",
            }, -- one of "all" or a list of languages
            context_commentstring = { enable = true }, 
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "css" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = { "markdown" },
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { "css" } },
            rainbow = {
                enable = true,
                query = "rainbow-parens",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = {
            patterns = {
                html = {
                    "div",
                    "ul",
                    "table",
                    "tr",
                },
            },
        }
    },
}
