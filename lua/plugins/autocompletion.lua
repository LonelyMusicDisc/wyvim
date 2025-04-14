local P = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
}

P.dependencies = {
	{
		"L3MON4D3/LuaSnip",
		build = (function()
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
	},
	"saadparwaiz1/cmp_luasnip",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",

	"octaltree/cmp-look",
}

P.config = function()
	-- See `:help cmp`
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	luasnip.config.setup({})

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },

		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),

			["<C-y>"] = cmp.mapping.confirm({ select = true }),

			["<C-Space>"] = cmp.mapping.complete({}),

			["<C-l>"] = cmp.mapping(function()
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { "i", "s" }),
			["<C-h>"] = cmp.mapping(function()
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "lazydev", group_index = 0 },
		},
	})
	require("cmp").setup.filetype({ "markdown", "norg" }, {
		sources = {
			{
				name = "look",
				keyword_length = 3,
				option = {
					convert_case = true,
					loud = true,
				},
			},
		},
	})
end

return P
