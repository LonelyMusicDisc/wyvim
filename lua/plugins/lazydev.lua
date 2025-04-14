local P = {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			"lazy.nvim",
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}

return P
