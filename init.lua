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
Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter')
Plug('preservim/nerdtree')
Plug('ms-jpq/coq_nvim')
Plug('ms-jpq/coq.artifacts', { branch = 'artifacts' })
Plug('ms-jpq/coq.thirdparty')
Plug('dgagn/diagflow.nvim')
Plug('sainnhe/everforest')

vim.call('plug#end')

require("config.mappings")
require("config.options")
require("config.autocmd")
require("config.statusline")
require("config.diag")

require("plugins.fzf-lua")
require("plugins.treesitter")
require("plugins.nerd-tree")
require("plugins.everforest")
require("plugins.lsp")
require("plugins.coqtp")
require("plugins.diagflow")
