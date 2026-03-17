return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod',ft = { 'sql', 'mysql', 'plsql' },lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    --
    -- keys = {
    --     { "<M-s>", ":DBUIToggle<CR>", desc = "toggle the undoree" },
    -- },
    init = function()
        -- Configuration
        vim.g.db_ui_winwidth = 30
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_help = 0
        vim.g.db_ui_disable_progress_bar = 1
        vim.g.db_ui_win_position = "right"
        vim.g.db_ui_show_database_icon = 1
        vim.g.dbs = {
            dev = 'postgres://medusa_admin:medusa_admin@localhost:5432/hopbox_db',
            mongoLocal =
            "mongodb://127.0.0.1:27017/AllocatePDO?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.11"
        }
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'dbout' },
            callback = function()
                vim.opt.foldenable = false
            end,
        })
    end,
}
