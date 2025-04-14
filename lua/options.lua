-- NOTE: You can change these options as you wish!
-- For more options, see `:help option-list`

local option_list = {
	-- Make line numbers default
	-- Add relative line numbers, for help with jumping
	number = true,
	relativenumber = true,

	-- Enable mouse mode, can be useful for resizing splits for example
	mouse = "a",

	-- Don't show the mode, since it's already in status line
	showmode = false,

	-- Sync clipboard between OS and Neovim.
	--  See `:help 'clipboard'`
	-- clipboard = "unnamedplus",

	-- Enable break indent
	breakindent = true,

	-- Save undo history
	undofile = true,

	-- Case-insensitive searching UNLESS \C or capital in search
	ignorecase = true,
	smartcase = true,

	-- Keep signcolumn on by default
	signcolumn = "yes",

	-- Decrease update time
	updatetime = 250,
	timeoutlen = 300,

	-- Configure how new splits should be opened
	splitright = true,
	splitbelow = true,

	-- Sets how neovim will display certain whitespace in the editor.
	--  See `:help 'list'`
	--  and `:help 'listchars'`
	list = true,
	listchars = { tab = "» ", trail = "·", nbsp = "␣" },

	-- Number of spaces to use for tabs.
	tabstop = 3,
	shiftwidth = 3,

	-- Preview substitutions live, as you type!
	inccommand = "split",

	-- Show which line your cursor is on
	cursorline = true,
	cursorlineopt = "number",

	-- Minimal number of screen lines to keep above and below the cursor.
	scrolloff = 10,

	-- Hide short key presses
	showcmd = false,

	-- Hide markup symbols, such as *bold*
	conceallevel = 2,
	concealcursor = "n",

	-- Popup blend and maximum number of entries in a popup.
	pumblend = 10,
	pumheight = 10,

	-- The command line's height
	cmdheight = 0,

	-- Ensure colorschemes use full color range
	termguicolors = true,

	-- Opinionated gui cursor
	guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:Cursor/lCursor,sm:block",

	-- Smooth scrolling
	smoothscroll = true,

	-- Spellfile
	spellfile = string.format("%s/.local/share/%s/spellfile.UTF-8.add", vim.env.HOME, vim.env.NVIM_APPNAME),

	-- Limit to one statusbar instead of many
	laststatus = 3,

	exrc = true,

	secure = true,
}

for option, value in pairs(option_list) do
	vim.opt[option] = value
end

---Create augroup
---@param name string
local function augroup(name)
	return vim.api.nvim_create_augroup("wyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
	group = augroup("show_recording"),
	callback = function()
		vim.notify(string.format("Recording @%s", vim.fn.reg_recording()), vim.log.levels.INFO)
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	group = augroup("finish_recording"),
	callback = function()
		vim.notify("Finished recording", vim.log.levels.INFO)
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = augroup("show_cmdline"),
	callback = function()
		vim.o.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = augroup("hide_cmdline"),
	callback = function()
		vim.o.cmdheight = 0
	end,
})

vim.api.nvim_create_autocmd("DirChanged", {
	group = augroup("attempt_exrc"),
	callback = function()
		if vim.o.exrc and vim.secure.read(vim.fn.getcwd() .. "/.nvim.lua") then
			dofile(vim.fn.getcwd() .. "/.nvim.lua")
		end
	end,
})

vim.g.markdown_recommended_style = 0
