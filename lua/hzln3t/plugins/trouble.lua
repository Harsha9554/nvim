return {
    "folke/trouble.nvim",
    opts = {
        icons = false,
        auto_open = false,
        fold_open = ">", -- icon used for open folds
        fold_closed = "v", -- icon used for closed folds
        indent_lines = true, -- add an indent guide below the fold icons
        signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I",
        },
        use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
        action_keys = {
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            preview = nil, -- preview the diagnostic location
            previous = nil, -- previous item
            next = "j", -- next item
        },
    }
}
