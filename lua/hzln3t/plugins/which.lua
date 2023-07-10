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

            -- trouble
            x = {
                name = "trouble",
                x = { "<cmd>TroubleToggle<cr>", "trouble-toggle", opts },
                w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace-diagnositcs", opts },
                d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document-diagnositcs", opts },
                l = { "<cmd>TroubleToggle loclist<cr>", "trouble-loclist", opts },
                q = { "<cmd>TroubleToggle quickfix<cr>", "trouble-quickfix", opts },
                t = { "<cmd>:TodoTelescope<cr>", "trouble-todo", opts },
            },

            -- ufo
            f = {
                name = "fold",
                a = { ":lua require('ufo').closeAllFolds()<CR>", "fold-all", opts },
                t = { "zc", "fold-this-block", opts },
            },

            u = {
                name = "unfold",
                a = { ":lua require('ufo').openAllFolds()<CR>", "unfold-all", opts },
                t = { "zO", "unfold-this-block", opts },
                k = {
                    function()
                        local winid = require("ufo").peekFoldedLinesUnderCursor()
                        if not winid then
                            -- choose one of coc.nvim and nvim lsp
                            vim.lsp.buf.hover()
                        end
                    end,
                    "peek-this-block",
                    opts,
                },
            },

            -- lsp
            l = {
                name = "lsp",
                c = { ":lua vim.lsp.buf.code_action()<CR>", "code-actions", opts },
                d = { ":lua vim.lsp.buf.definition()<CR>", "definition", opts },
                h = { ":lua vim.lsp.buf.hover()<CR>", "hover", opts },
                s = { ":lua vim.lsp.buf.signature_help()<CR>", "signature", opts },
                n = { ":lua vim.lsp.buf.rename()", "rename", opts },
                r = { "<cmd>TroubleToggle lsp_references<CR>", "references", opts },
                w = { ":lua vim.lsp.buf.workspace_symbol()<CR>", "workspace-symbol", opts },
                f = { ":lua vim.lsp.buf.format()<CR>", "format", opts },
            },

            -- spectre
            s = { "<cmd>lua require('spectre').open()<CR>", "spectre", opts },

            -- confiture
            c = {
                name = "confiture",
                r = { ":silent! wa<cr>:Confiture runner<cr>", "eleet-runner" },
            },

            -- don't wanna show them on which key
            ["<CR>"] = { ":so %<cr>:lua print('sourced-neovim.');<CR>", "which_key_ignore", opts },

        }, { prefix = "<leader>" })

    end,
}
