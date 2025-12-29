local P = {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({})
	end,
}

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Binding overwrites when using zk.",
	group = vim.api.nvim_create_augroup("zk_keybindings", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end
		if not client.name == "zk" then
			return
		end
		vim.api.nvim_buf_set_keymap(0, "n", "<LEADER>nn", "<CMD>ZkNew<CR>", { desc = "New" })
		vim.api.nvim_buf_set_keymap(0, "n", "<LEADER>nf", "<CMD>ZkNotes<CR>", { desc = "Find" })
		vim.api.nvim_buf_set_keymap(0, "n", "<LEADER>nt", "<CMD>ZkTags<CR>", { desc = "Tags" })
		vim.api.nvim_buf_set_keymap(0, "n", "<LEADER>ni", "<CMD>ZkInsertLink<CR>", { desc = "Insert link" })
	end,
})

return P
