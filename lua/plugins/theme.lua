local P = {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
}

P.config = function(_, opts)
	require("kanagawa").setup(opts)
	vim.cmd.colorscheme("kanagawa-lotus")
end

P.opts = {
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
		}
	end,
}

return P
