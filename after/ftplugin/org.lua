---@diagnostic disable-next-line: undefined-field
vim.opt_local.formatoptions:append({ "t" })
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.foldlevel = 99
vim.opt_local.expandtab = false
vim.opt_local.fillchars = { vert = " ", eob = " " }

do -- Mappings
	local set = vim.keymap.set
	set("n", "k", "gk")
	set("n", "j", "gj")
end
