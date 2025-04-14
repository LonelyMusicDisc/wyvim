-- vim: foldmethod=marker foldlevel=0

vim.g.notes_dir = "~/Documents/Notes"

local function create_note()
	vim.ui.input({ prompt = "Note name: " }, function(input)
		if not input then
			return
		end

		local note = string.format("/%s/%s.md", vim.fn.expand(vim.g.notes_dir), input)

		if vim.fn.filereadable(note) ~= 0 then
			vim.notify("File already exists", 3)
			create_note()
			return
		end

		vim.cmd.edit(note)
	end)
end

vim.api.nvim_create_user_command("Notes", function(opts)
	if opts.fargs[1] == "new" then
		create_note()
	end
	if opts.fargs[1] == "find" then
		require("snacks.picker").files({ cwd = vim.g.notes_dir })
	end
end, {
	desc = "Manage notes",
	nargs = 1,
	complete = function()
		return { "new", "find" }
	end,
})

vim.keymap.set("n", "<Leader>nn", create_note, { desc = "New" })
vim.keymap.set("n", "<Leader>nf", function()
	require("snacks.picker").files({ cwd = "~/Documents/Notes/" })
end, { desc = "Find" })
