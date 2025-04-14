local P = {
	"folke/which-key.nvim",
	event = "UIEnter",
}

P.opts = {
	preset = "helix",
	win = { no_overlap = false },
	icons = { rules = false },
	plugins = { spelling = false },
	defaults = {
		mode = { "n", "v" },
		{ "<Leader>b", group = "buffer" },
		{ "<Leader>c", group = "code" },
		{ "<Leader>f", group = "file" },
		{ "<Leader>h", group = "help" },
		{ "<Leader>n", group = "notes" },
		{ "<Leader>o", group = "org" },
		{ "<Leader>q", group = "quit" },
		{ "<Leader>s", group = "search" },
		{ "<Leader>t", group = "toggle" },
		{ "<Leader>u", group = "ui" },
		{ "<Leader>w", proxy = "<C-w>", group = "windows" },
		{ "[", group = "prev" },
		{ "]", group = "next" },
		{ "g", group = "goto" },
		{ "gs", group = "surround" },
		{ "z", group = "fold" },
	},
}

P.config = function(_, opts)
	local wk = require("which-key")
	wk.setup(opts)
	wk.add(opts.defaults)
end

return P
