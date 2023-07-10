return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()

        local wk = require("which-key")

        wk.setup({
            spelling = {
                enabled = false,
                suggestions = 15,
            },
            ignore_missing = true,
        })

        local opts = { noremap = true, silent = true, buffer = bufnr }

        wk.register({
            -- telescope
            t = {
                name = "telescope",
                f = { "<cmd>Telescope find_files<CR>", "find-files", opts },
                b = { "<cmd>Telescope buffers<CR>", "find-buffers", opts },
                s = { "<cmd>Telescope persisted theme=get_dropdown<CR>", "find-sessions", opts },
                g = { "<cmd>Telescope live_grep<CR>", "live-grep-files", opts },
                h = { "<cmd>Telescope help_tags<CR>", "help-tags", opts },
            },
        }, { prefix = "<leader>" })

    end,
}
