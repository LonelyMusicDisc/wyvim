-- A Minimalist TODO management plugin.
local P = { "atiladefreitas/dooing" }

P.config = function()
	require("dooing").setup({
		notes = {
			icon = "󰎚",
		},
		keymaps = {
			toggle_window = "<Leader>td",
			remove_duplicates = "<Leader>D",
			open_todo_scratchpad = "",
		},
	})
end

return P
