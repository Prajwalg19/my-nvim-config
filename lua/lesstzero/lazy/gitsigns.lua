return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation between hunks
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Next git hunk' })

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Previous git hunk' })

                -- Actions & Toggles
                map('n', '<leader>gt', gs.toggle_deleted, { desc = 'Toggle deleted lines (-/+ diff)' })
                map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview git hunk' })
                map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset git hunk' })
                map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage git hunk' })
                map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle git blame' })
            end
        })
    end
}
