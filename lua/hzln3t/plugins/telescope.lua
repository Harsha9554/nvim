return {
	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.2',
		dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local action_state = require("telescope.actions.state")
            local actions = require("telescope.actions")

            local function telescope_buffer_dir()
                return vim.fn.expand("%:p:h")
            end

            actions.open_in_vscode = function(prompt_bufnr)
                local path = action_state.get_selected_entry().value
                local temp = string.format(":te code %s", path)
                actions.close(prompt_bufnr)
                vim.cmd(temp)
            end

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                            ["v"] = actions.open_in_vscode,
                        },
                    },
                    file_ignore_patterns = { "node_modules", ".git/" },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        hidden = true,
                        respect_gitignore = true,
                    },
                },
                extensions = {
                    file_browser = {
                        dir_icon = " ",
                        theme = "ivy",
                        hijack_netrw = true,
                        respect_gitignore = true,
                        mappings = {},
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    }
                },
            })

            vim.keymap.set("n", "<leader>e", function()
                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "normal",
                })
            end)

            telescope.load_extension("file_browser")
            telescope.load_extension("persisted")
            telescope.load_extension("ui-select")

        end
	},

}
