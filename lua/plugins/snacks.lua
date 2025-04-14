-- A collection of small and helpful modules, such as a file picker.
local P = {
	dir = "~/Programs/Clones/snacks.nvim/",
}

---@class snacks.config
P.opts = {
	picker = {
		icons = {
			files = {
				enabled = false,
			},
		},
		layout = {
			preset = "telescope",
		},
	},
	input = {},
	rename = {},
	styles = {
		lazygit = {
			backdrop = 100,
		},
	},
}

P.keys = {
	{
		"<leader><leader>",
		function()
			require("snacks.picker").files()
		end,
		desc = "Find file",
	},
	{
		"<leader>ff",
		function()
			require("snacks.picker").files()
		end,
		desc = "Find",
	},
	{
		"<leader>fr",
		function()
			require("snacks.picker").recent()
		end,
		desc = "Recent",
	},
	{
		"<leader>fg",
		function()
			require("snacks.picker").grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>sp",
		function()
			require("snacks.picker").projects()
		end,
		desc = "Projects",
	},
	{
		"<leader>hc",
		function()
			require("snacks.picker").colorschemes()
		end,
		desc = "Colorschemes (live)",
	},
	{
		"<leader>bf",
		function()
			require("snacks.picker").buffers()
		end,
		desc = "Find",
	},
	{
		"<leader>ht",
		function()
			require("snacks.picker").help()
		end,
		desc = "Help tags",
	},
	{
		"<leader>sz",
		function()
			require("snacks.picker").zoxide()
		end,
		desc = "Folder (zoxide)",
	},
	{
		"<leader>g",
		function()
			require("snacks.lazygit").open()
		end,
		desc = "Lazygit",
	},
	{
		"<leader>ss",
		function()
			require("snacks.picker").lsp_symbols()
		end,
		desc = "Symbols",
	},
	{
		"<leader>sS",
		function()
			require("snacks.picker").lsp_workspace_symbols()
		end,
		desc = "Workspace Symbols",
	},
	{
		"z=",
		function()
			require("snacks.picker").spelling()
		end,
		desc = "Spelling suggestions",
	},
}

return P
