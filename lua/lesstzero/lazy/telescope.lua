return {   -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --
            -- defaults = {
            --   mappings = {
            --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
            --   },
            -- },
            -- pickers = {}
            theme = 'center',
            preview = false,

            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'
        -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search Files' })
        -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
        -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>fa', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = 'grep out the whole file' })
        vim.keymap.set('n', '<leader>ht', builtin.colorscheme, { desc = 'change colorscheme' })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        -- vim.keymap.set('n', '<leader>s/', function()
        --   builtin.live_grep {
        --     grep_open_files = true,
        --     prompt_title = 'Live Grep in Open Files',
        --   }
        -- end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        -- vim.keymap.set('n', '<leader>sn', function()
        --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
        -- end, { desc = '[S]earch [N]eovim files' })
    end,
}



--return {
--    'nvim-telescope/telescope.nvim',
--    tag = '0.1.6',
--    dependencies = { 'nvim-lua/plenary.nvim' },
--    cmd = "Telescope",
--    keys = {
--        { "<leader>fa", "<cmd>Telescope oldfiles<cr>",                   desc = "Telescope" },
--        { "<leader>ff", "<cmd>Telescope find_files<cr>",                 desc = "Telescope" },
--        { "<leader>fr", "<cmd>Telescope live_grep<cr>",                  desc = "Telescope" },
--        { "<leader>ht", "<cmd>Telescope colorscheme<cr>",                desc = "Telescope" },
--        -- { "<leader>fb", "<cmd>Telescope file_browser<cr>",               desc = "File browser" },
--        { "<leader>fw", "<cmd>Telescope buffers sort_lastused=true<cr>", desc = "Buffers sorted by last used" }
--    },
--    -- config = function(_, opts)
--    --     local telescope = require("telescope")
--    --     local fb_actions = require("telescope").extensions.file_browser.actions
--    --
--    --     opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
--    --         wrap_results = true,
--    --         layout_strategy = "horizontal",
--    --         layout_config = { prompt_position = "top" },
--    --         sorting_strategy = "ascending",
--    --         winblend = 0,
--    --         mappings = {
--    --             n = {},
--    --         },
--    --     })
--    --     opts.pickers = {
--    --         diagnostics = {
--    --             theme = "ivy",
--    --             initial_mode = "normal",
--    --             layout_config = {
--    --                 preview_cutoff = 9999,
--    --             },
--    --         },
--    --     }
--    --     opts.extensions = {
--    --         file_browser = {
--    --             theme = "dropdown",
--    --             -- disables netrw and use telescope-file-browser in its place
--    --             hijack_netrw = true,
--    --             mappings = {
--    --                 -- your custom insert mode mappings
--    --                 ["n"] = {
--    --                     -- your custom normal mode mappings
--    --                     ["a"] = fb_actions.create,
--    --                     ["h"] = fb_actions.goto_parent_dir,
--    --                     ['c'] = false,
--    --                     ["o"] = function(prompt_bufnr)
--    --                         require("telescope.actions").select_default(prompt_bufnr)
--    --                     end,
--    --                     ["<C-u>"] = function(prompt_bufnr)
--    --                         for i = 1, 10 do
--    --                             actions.move_selection_previous(prompt_bufnr)
--    --                         end
--    --                     end,
--    --                     ["<C-d>"] = function(prompt_bufnr)
--    --                         for i = 1, 10 do
--    --                             actions.move_selection_next(prompt_bufnr)
--    --                         end
--    --                     end,
--    --                     ["<PageUp>"] = actions.preview_scrolling_up,
--    --                     ["<PageDown>"] = actions.preview_scrolling_down,
--    --                 },
--    --             },
--    --         },
--    --     }
--    --     telescope.setup(opts)
--    --     require("telescope").load_extension("fzf")
--    --     require("telescope").load_extension("file_browser")
--    -- end,

--    config = function()
--        local actions = require("telescope.actions")
--        require("telescope").setup({
--            defaults = {
--                -- file_ignore_patterns = { "%.class", "node_modules" },
--                theme = "center",
--                preview = false
--                --sorting_strategy = "ascending",
--                -- layout_config = {
--                --     horizontal = {
--                --         prompt_position = "top",
--                --     },
--                -- },

--            },
--            extensions = {
--                file_browser = {
--                    theme = "ivy",
--                    -- disables netrw and use telescope-file-browser in its place
--                    initial_mode = "normal",
--                    hijack_netrw = true,
--                    mappings = {
--                        ["i"] = {
--                        },
--                        ["n"] = {
--                            ["a"] = function(prompt_bufnr)
--                                local fb_actions = require("telescope._extensions.file_browser.actions")
--                                fb_actions.create(prompt_bufnr)
--                            end,
--                            ["<C-u>"] = function(prompt_bufnr)
--                                for i = 1, 10 do
--                                    actions.move_selection_previous(prompt_bufnr)
--                                end
--                            end,
--                            ["<C-d>"] = function(prompt_bufnr)
--                                for i = 1, 10 do
--                                    actions.move_selection_next(prompt_bufnr)
--                                end
--                            end,

--                        },
--                    },
--                },
--            },
--        })
--    end

--}
