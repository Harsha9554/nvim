return {
    "olimorris/persisted.nvim",
    config = function()
        require("persisted").setup({
            silent = false, -- silent nvim message when sourcing session file
            use_git_branch = true, -- create session files based on the branch of the git enabled repository
            autosave = false, -- automatically save session files when exiting Neovim
            should_autosave = nil, -- function to determine if a session should be autosaved
            autoload = true, -- automatically load the session for the cwd on Neovim startup
            follow_cwd = true, -- change session file name to match current working directory if it changes
            telescope = { -- options for the telescope extension
                reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
            },
        })
    end,
}
