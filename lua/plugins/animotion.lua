return {
	"luiscassih/AniKakoune",
	event = "VeryLazy",
	enabled = false,
	config = function()
		require("AniMotion").setup({
			mode = "helix",
			clear_keys = { "<C-c>" },
			color = "Visual",
		})
	end,
}
