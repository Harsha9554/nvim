return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        -- LSP Support
        "neovim/nvim-lspconfig" ,
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            config = function()
                require('mason').setup()
            end,
        },
        "williamboman/mason-lspconfig.nvim" ,
        "jay-babu/mason-null-ls.nvim" ,
        "jay-babu/mason-nvim-dap.nvim" ,

        -- Autocompletion
        "hrsh7th/nvim-cmp" ,
        "hrsh7th/cmp-buffer" ,
        "hrsh7th/cmp-path" ,
        "hrsh7th/cmp-nvim-lsp" ,
        "hrsh7th/cmp-nvim-lua" ,
        "saadparwaiz1/cmp_luasnip" ,

        -- Snippets
        {
            "L3MON4D3/LuaSnip",
            after = "nvim-cmp",
            config = function()
                local luasnip = require("luasnip")
                luasnip.config.set_config({
                    history = true,
                })
                require("luasnip.loaders.from_snipmate").lazy_load({
                    paths = vim.fn.stdpath("config") .. "/snippets/snip-mate",
                })
            end,
        },
        "rafamadriz/friendly-snippets" ,
    },
    config = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings,
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "calc" },
            },
            formatting = {
                -- changing the order of fields so the icon is the first
                fields = { "menu", "abbr", "kind" },
                -- here is where the change happens
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[LUA]",
                        luasnip = "[SNIP]",
                        buffer = "[BUFFER]",
                        path = "[PATH]",
                        calc = "[CALC]",
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
        })

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = "E",
                warn = "W",
                hint = "H",
                info = "I",
            },
        })

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })

    end
}
