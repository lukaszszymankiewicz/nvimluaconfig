local options = {
	number = true,
	encoding = "utf-8",
	colorcolumn = "100",
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	textwidth = 100,
	fileformat = "unix",
	clipboard = "unnamedplus",
	autoindent = true,
	syntax = "on",
	splitright = true,
	expandtab = true,
	-- termguicolors = true,
	ignorecase = true,
	smartcase = true,
    background = dark,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.g.python3_host_prog = "/usr/bin/python3"
