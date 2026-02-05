-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ibhagwan/fzf-lua')
Plug('ms-jpq/coq.artifacts', { branch = 'artifacts' })
Plug('ms-jpq/coq.thirdparty')
Plug('ms-jpq/coq_nvim')
Plug('neovim/nvim-lspconfig')
Plug('preservim/nerdtree')
Plug('ranelpadon/python-copy-reference.vim')
Plug('sainnhe/everforest')
Plug('stevearc/conform.nvim')
Plug('mfussenegger/nvim-lint')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('olimorris/codecompanion.nvim')
Plug('nvim-mini/mini.diff')

vim.call('plug#end')

require("config.mappings")
require("config.options")
require("config.statusline")
require("config.diag")
require("config.hover")
require("config.sql")

require("plugins.fzf-lua")
require("plugins.treesitter")
require("plugins.nerd-tree")
require("plugins.everforest")
require("plugins.lsp")
require("plugins.coqtp")
require("plugins.conform")
require("plugins.nvimlint")
require("plugins.cc")

