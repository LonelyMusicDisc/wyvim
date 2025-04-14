-- vim: foldmethod=marker foldlevel=0
local map = vim.keymap.set

-- {{{ Miscellaneous
map("n", "U", vim.cmd.redo)
map("n", "<Tab>", "za")
map("n", "<Esc>", vim.cmd.nohlsearch)
-- }}}

-- {{{ Clipboard
do
	local mode = { "n", "v", "s", "o" }
	map(mode, "<Leader>p", '"+p', { desc = "Paste (clipboard)" })
	map(mode, "<Leader>P", '"+P', { desc = "Paste before (clipboard)" })
	map(mode, "<Leader>y", '"+y', { desc = "Yank to clipboard" })
end
-- }}}

-- {{{ Files
map("n", "<Leader>fs", vim.cmd.write, { desc = "Save" })
-- }}}

-- {{{ Buffers
map("n", "<Leader>bd", vim.cmd.bdelete, { desc = "Delete" })
map("n", "<Leader>bk", function()
	vim.cmd.bdelete({ bang = true })
end, { desc = "Kill" })
map("n", "]b", vim.cmd.bnext, { desc = "Next buffer" })
map("n", "[b", vim.cmd.bprevious, { desc = "Previous buffer" })
-- }}}

-- {{{ Toggles
map("n", "<Leader>tn", function()
	vim.cmd("set number!")
end, { desc = "Number line" })
map("n", "<Leader>tr", function()
	vim.cmd("set relativenumber!")
end, { desc = "Relative numbers" })
map("n", "<Leader>tw", function()
	vim.cmd("set wrap!")
end, { desc = "Wrap" })
-- }}}

-- {{{ Word count
do
	local function notify_wordcount()
		if vim.fn.wordcount().visual_words == nil then
			vim.notify(string.format("%d words", vim.fn.wordcount().words), vim.log.levels.INFO)
		else
			vim.notify(string.format("%d words", vim.fn.wordcount().visual_words), vim.log.levels.INFO)
		end
	end
	local mode = { "n", "v" }
	map(mode, "<leader>bw", notify_wordcount, { desc = "Word count" })
	map(mode, "g<C-g>", notify_wordcount, { desc = "Word count" })
end
-- }}}

-- {{{ Quit
do
	map("n", "<Leader>qq", function()
		vim.cmd("quit")
	end, { desc = "Quit" })
	map("n", "<Leader>qa", function()
		vim.cmd("quitall")
	end, { desc = "Quit all" })
	map("n", "<Leader>qQ", function()
		vim.cmd("quit", { bang = true })
	end, { desc = "Force quit" })
	map("n", "<Leader>qA", function()
		vim.cmd("quitall", { bang = true })
	end, { desc = "Force quit all" })
end
-- }}}
