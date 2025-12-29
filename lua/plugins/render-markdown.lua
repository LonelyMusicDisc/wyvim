local P = {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
}

---@module 'render-markdown'
---@type render.md.UserConfig
P.opts = {
	heading = {
		sign = false,
		foregrounds = {},
		backgrounds = {},
		icons = {},
	},
	bullet = {
		enabled = false,
	},
}

return P
