-- File management with Vim's keymaps and text editing.
local P = {
	"stevearc/oil.nvim",
	event = "VimEnter",
	cmd = "Oil",
}

P.opts = {
	keymaps = {
		["<C-q>"] = { "actions.send_to_qflist", opts = { action = "a", only_matching_search = false } },
		["<C-Q>"] = { "actions.send_to_qflist", opts = { action = "r", only_matching_search = true } },
	},
}

P.keys = {
	{ "<leader>fm", "<cmd>Oil<cr>", desc = "Manager" },
}

vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			require("snacks.rename").on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

return P
