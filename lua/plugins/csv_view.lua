local P = {
	"hat0uma/csvview.nvim",
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	ft = { "csv", "tsv" },
}

---@module "csvview"
---@type CsvView.Options
P.opts = {
	parser = {
		comments = { "#", "//" },
	},
	keymaps = {
		-- NOTE: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
		textobject_field_inner = { "if", mode = { "o", "x" } },
		textobject_field_outer = { "af", mode = { "o", "x" } },
		jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
		jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
		jump_next_row = { "<Enter>", mode = { "n", "v" } },
		jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
	},
	view = {
		display_mode = "border",
	},
}

return P
