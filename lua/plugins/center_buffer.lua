local P = {
	"shortcuts/no-neck-pain.nvim",
	cmd = {
		"NoNeckPain",
		"NoNeckPainResize",
		"NoNeckPainToggleLeftSide",
		"NoNeckPainToggleRightSide",
		"NoNeckPainWidthUp",
		"NoNeckPainWidthDown",
	},
}

P.keys = {
	{
		"<leader>tc",
		function()
			require("no-neck-pain").toggle()
		end,
		desc = "Centered buffer",
	},
	{
		"<C-w>m",
		function()
			if not require("no-neck-pain.state").enabled then
				vim.notify("Enable centered buffer first.", 2)
				return
			end
			vim.ui.input({ prompt = "Margin size: ", default = "0" }, function(input)
				require("no-neck-pain").resize(tonumber(input, 10))
			end)
		end,
		desc = "Resize margins",
	},
}

P.opts = {
	autocmds = {
		skipEnteringNoNeckPainBuffer = true,
	},
	buffers = {
		wo = {
			fillchars = "eob: ,vert: ",
		},
	},
}

return P
