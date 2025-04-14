local P = {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
}

P.config = function()
	require("luasnip.loaders.from_lua").load({ paths = { vim.fn.getcwd() .. "/.luasnippets/" } })

	vim.api.nvim_create_autocmd("DirChanged", {
		group = vim.api.nvim_create_augroup("personal_snippets", { clear = true }),
		pattern = "global",
		callback = function()
			require("luasnip.loaders.from_lua").load({ paths = { vim.fn.getcwd() .. "/.luasnippets/" } })
		end,
	})
end

return P
