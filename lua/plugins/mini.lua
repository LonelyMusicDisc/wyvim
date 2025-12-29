-- vim: foldmethod=marker foldlevel=0
-- A collection of small and helpful modules.
local P = {
	"nvim-mini/mini.nvim",
	version = false,
	lazy = false,
}

P.config = function()
	-- {{{ icons
	require("mini.icons").setup()
	require("mini.icons").mock_nvim_web_devicons()
	-- }}}
	-- {{{ statusline
	require("mini.statusline").setup({
		use_icons = vim.g.have_nerd_font,
	})
	---@diagnostic disable-next-line: duplicate-set-field
	require("mini.statusline").section_location = function()
		return "%2l:%-2v"
	end
	-- }}}
	-- {{{ notify
	require("mini.notify").setup({
		content = {
			format = function(notifaction)
				return string.format(
					"%s | %s",
					vim.fn.strftime("%H:%M", vim.fn.floor(notifaction.ts_add)),
					notifaction.msg
				)
			end,
		},
	})
	vim.notify = require("mini.notify").make_notify()
	-- }}}
	-- {{{ pairs
	require("mini.pairs").setup()
	-- }}}
	-- {{{ surround
	require("mini.surround").setup({
		mappings = {
			add = "gsa",
			delete = "gsd",
			find = "gsf",
			find_left = "sF",
			highlight = "gsh",
			replace = "gsr",
			update_n_lines = "gsn",

			suffix_last = "l",
			suffix_next = "n",
		},
	})
	-- }}}
	-- {{{ starter
	local starter = require("mini.starter")
	local v = vim.version()
	local picker = require("snacks.picker")
	starter.setup({
		evaluate_single = true,
		items = {
			{
				name = "Notes",
				action = function()
					picker.files({ cwd = "~/Documents/Notes/" })
				end,
				section = "",
			},
			{
				name = "Projects",
				action = function()
					picker.projects()
				end,
				section = "",
			},
			{
				name = "Find file",
				action = function()
					picker.files()
				end,
				section = "",
			},
			{
				name = "Recent files",
				action = function()
					picker.recent()
				end,
				section = "",
			},
			{
				name = "Empty buffer",
				action = function()
					vim.cmd.enew()
				end,
				section = "",
			},
			{ name = "Quit", action = ":q", section = "" },
		},
		content_hooks = { starter.gen_hook.adding_bullet(""), starter.gen_hook.aligning("center", "center") },
		header = string.format(
			[[
██╗    ██╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║    ██║╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║ █╗ ██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
██║███╗██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
╚███╔███╔╝   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚══╝╚══╝    ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
							%s.%s.%s
		]],
			v.major,
			v.minor,
			v.patch
		),
		footer = "Whatever you do, keep writing.",
		silent = true,
	})
	vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", { link = "Character" })
	-- }}}
end

return P
