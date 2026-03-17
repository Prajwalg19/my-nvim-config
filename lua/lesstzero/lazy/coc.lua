return {
    -- "neoclide/coc.nvim",
    -- branch = "release",
    -- event = { "InsertEnter", "CmdlineEnter" },
    -- config = function()
    --     vim.defer_fn(function()
    --         local keyset = vim.keymap.set
    --         local opts = { silent = true, nowait = true, expr = true }

    --         -- Optimized CR handling for completion
    --         vim.api.nvim_set_keymap("i", '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"',
    --             { expr = true, noremap = true, silent = true })

    --         keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
    --         keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
    --         keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
    --         keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    --         keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    --         keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
    --         keyset("n", "<leader>s", "<Plug>(coc-rename)", { silent = true })

    --         -- Documentation functions
    --         function _G.show_docs()
    --             if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    --                 vim.api.nvim_command('h ' .. vim.fn.expand('<cword>'))
    --             elseif vim.api.nvim_eval('coc#rpc#ready()') == 1 then
    --                 vim.fn.CocActionAsync('doHover')
    --             end
    --         end

    --         function _G.enter_float()
    --             if vim.fn['coc#float#has_float']() == 1 then
    --                 vim.fn['coc#float#jump']()
    --             end
    --         end

    --         keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
    --         keyset("n", "KK", '<CMD>lua _G.enter_float()<CR>', { silent = true })

    --         local has_float_scroll = vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1
    --         if has_float_scroll then
    --             keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    --             keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
    --             keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    --             keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
    --             keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    --             keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
    --         end

    --         keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
    --         vim.api.nvim_create_user_command("Format", "silent! call CocAction('format')", {})

    --         local coc_group = vim.api.nvim_create_augroup("CocGroup", {})
    --         vim.opt.updatetime = 500

    --         vim.api.nvim_create_autocmd("CursorHold", {
    --             group = coc_group,
    --             command = "silent call CocActionAsync('highlight')",
    --             desc = "Highlight symbol under cursor on CursorHold"
    --         })

    --         vim.api.nvim_create_autocmd("User", {
    --             group = coc_group,
    --             pattern = "CocJumpPlaceholder",
    --             callback = function()
    --                 vim.fn.CocActionAsync('showSignatureHelp')
    --             end,
    --             desc = "Update signature help on jump placeholder"
    --         })

    --         vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
    --         vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
    --             {})

    --         vim.o.statusline = vim.o.statusline .. '%{coc#status()}'

    --         vim.g.coc_snippet_next = '<c-j>'
    --         vim.g.coc_snippet_prev = '<c-k>'
    --         vim.g.coc_enable_auto_import = 1

    --         --  Add on_attach-like behavior for JS/TS file saves
    --         vim.api.nvim_create_autocmd("User", {
    --             pattern = "CocNvimInit",
    --             callback = function()
    --                 -- Get active client via RPC call (Coc acts as client)
    --                 local client = {
    --                     notify = function(_, params)
    --                         -- Forward notification via Coc RPC
    --                         vim.fn.CocActionAsync('runCommand', '$/onDidChangeTsOrJsFile', params)
    --                     end
    --                 }

    --                 vim.api.nvim_create_autocmd("BufWritePost", {
    --                     pattern = { "*.js", "*.ts" },
    --                     callback = function(ctx)
    --                         client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
    --                     end,
    --                     desc = "Notify Coc of JS/TS file change"
    --                 })
    --             end,
    --             desc = "Attach onDidChangeTsOrJsFile autocmd when Coc is initialized"
    --         })

    --         -- autopairs integration
    --         local autopairs_loaded, npairs = pcall(require, 'nvim-autopairs')
    --         if autopairs_loaded then
    --             npairs.setup({ map_cr = false })

    --             _G.MUtils = {}
    --             MUtils.completion_confirm = function()
    --                 if vim.fn["coc#pum#visible"]() ~= 0 then
    --                     return vim.fn["coc#pum#confirm"]()
    --                 else
    --                     return npairs.autopairs_cr()
    --                 end
    --             end

    --             vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
    --                 { expr = true, noremap = true })
    --         end
    --     end, 50)
    -- end,
    -- dependencies = {
    --     "windwp/nvim-autopairs",
    -- }
}
