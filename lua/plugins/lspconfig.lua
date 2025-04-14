local P = {
	"neovim/nvim-lspconfig",
}

P.dependencies = {
	{ "williamboman/mason.nvim", opts = {} },
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
}

P.config = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("personal_lsp_attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			--  To jump back, press <C-t>.
			map("gd", require("snacks.picker").lsp_definitions, "Goto definition")

			map("gr", require("snacks.picker").lsp_references, "Goto references")

			map("gI", require("snacks.picker").lsp_implementations, "Goto implementation")

			map("<leader>cr", vim.lsp.buf.rename, "Rename")

			map("<leader>ca", vim.lsp.buf.code_action, "Code action")

			-- Opens a popup that displays documentation about the word under your cursor
			--  See `:help K` for why this keymap.
			map("K", vim.lsp.buf.hover, "Hover documentation")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header.
			map("gD", vim.lsp.buf.declaration, "Goto declaration")
			--
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.inlayHintProvider then
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "Toggle Inlay Hints")
			end
		end,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	--  Add any additional override configuration in the following tables. Available keys are:
	--  - cmd (table): Override the default command used to start the server
	--  - filetypes (table): Override the default list of associated filetypes for the server
	--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--  - settings (table): Override the default settings passed when initializing the server.
	--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
	local servers = {
		-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
		lua_ls = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = { disable = { "missing-fields" } },
				},
			},
		},
	}

	require("mason").setup()

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua",
	})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
end

return P
