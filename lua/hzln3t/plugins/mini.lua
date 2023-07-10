return {
    {
        "echasnovski/mini.nvim",
        version = '*',
        config = function()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.pairs").setup()
            require("mini.surround").setup()

            local starter = require("mini.starter")
            starter.setup({
                evaluate_single = true,
                footer = os.date(),
                header = table.concat({
                    [[           _                         _ ]],
                    [[       _==/          i     i          \== ]],
                    [[     /XX/            |\___/|            \XX\ ]],
                    [[   /XXXX\            |XXXXX|            /XXXX\ ]],
                    [[  |XXXXXX\_         _XXXXXXX_         _/XXXXXX| ]],
                    [[ XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX ]],
                    [[|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX| ]],
                    [[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ]],
                    [[|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX| ]],
                    [[ XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX ]],
                    [[  |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX| ]],
                    [[    \XX\       \X/    \XXX/    \X/       /XX/ ]],
                    [[       "\       "      \X/      "       /" ]],
                    [[                        ! ]],
                }, "\n"),
                items = {
                    function()
                        return {
                            { action = "Telescope find_files", name = "Files", section = "Telescope" },
                            { action = "Telescope file_browser", name = "Browser", section = "Telescope" },
                            { action = "Telescope live_grep", name = "Live Grep", section = "Telescope" },
                            {
                                action = "Telescope persisted",
                                name = "Sessions",
                                section = "Telescope",
                            },
                        }
                    end,
                    starter.sections.builtin_actions(),               
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.aligning("center", "center"),
                    starter.gen_hook.padding(3, 2),
                },           
            })
        end
    },
}
