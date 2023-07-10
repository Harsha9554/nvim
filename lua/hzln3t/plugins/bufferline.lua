return {
    "akinsho/bufferline.nvim",
    config = function()
        local bl = require("bufferline")
        bl.setup({
            options = {
                    mode = "tabs",
                    always_show_bufferline = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    show_buffer_icons = false,
                    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                },
        })
    end
}
