require("lesstzero.base")
require("lesstzero.maps")
require("lesstzero.lazy_init")

local augroup = vim.api.nvim_create_augroup
local LessTZeroGroup = augroup("LessTZero", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = LessTZeroGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- autocmd({ "BufWritePre" }, {
--     group = LessTZeroGroup,
--     pattern = "*.go",
--     callback = function()
--         vim.cmd("silent call CocAction('runCommand', 'editor.action.organizeImport')")
--         vim.cmd([[%s/\s\+$//e]])
--     end,

-- })

-- autocmd("BufWritePre", {
--     pattern = { "*.ts", "*.js", "*.svelte", "*.tsx", "*.jsx", ".lua" },
--     callback = function(args)
--         require("conform").format({ bufnr = args.buf })
--     end,
-- })

autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = true,
			focus = false,
			border = "rounded",
			source = "always",
			prefix = "",
			scope = "line",
		})
	end,
})

-- You can add this in your init.lua
-- or a global plugin
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Enable vim.lsp.completion",
	callback = function(event)
		local client_id = vim.tbl_get(event, "data", "client_id")
		if client_id == nil then
			return
		end

		-- warning: this api is unstable
		vim.lsp.completion.enable(true, client_id, event.buf, { autotrigger = false })

		-- warning: this api is unstable
		-- Trigger lsp completion manually using Ctrl + Space
		vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.completion.trigger()<cr>")
	end,
})

autocmd("LspAttach", {
	group = LessTZeroGroup,
	callback = function(e)
		local opts = { buffer = e.buf, silent = true }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>s", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "[g", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "]g", function()
			vim.diagnostic.goto_next()
		end, opts)
	end,
})
