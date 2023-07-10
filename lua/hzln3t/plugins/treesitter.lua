return {
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "help",
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
            ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
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
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },

        }
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

	"JoosepAlviste/nvim-ts-context-commentstring",
}
