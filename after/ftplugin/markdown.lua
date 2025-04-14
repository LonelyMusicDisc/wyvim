require("mini.pairs").map_buf(0, "i", "*", { action = "open", pair = "**", neigh_pattern = "[^\\]." })

---@diagnostic disable-next-line: undefined-field
vim.opt_local.formatoptions:append({ "t" })
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldlevel = 99
vim.opt_local.expandtab = true
vim.opt_local.fillchars = { vert = " ", eob = " " }

do -- Highlights
	local set = vim.api.nvim_set_hl
	set(0, "@markup.heading.2.markdown", { link = "Number" })
	set(0, "@markup.heading.3.markdown", { link = "DiagnosticOk" })
	set(0, "@markup.heading.4.markdown", { link = "Identifier" })
end

do -- Mappings
	local set = vim.keymap.set
	set("i", "<C-CR>", "<C-o>o- <ESC>", { noremap = true, silent = true })
	set("n", "k", "gk")
	set("n", "j", "gj")
end
