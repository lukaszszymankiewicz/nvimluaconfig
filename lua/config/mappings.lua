local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader><leader>", ":noh<CR>")
map("i", "<c-c>", "<ESC>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "Y", "y$")

map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

map("n", "<leader>h", ":tabprevious<CR>")
map("n", "<leader>l", ":tabnext<CR>")
map("n", "<leader>q", "<C-w>p")

map("n", "<leader>t", ":tabo<CR> :cclose<CR>")
map("n", "<leader>h", ":tabprevious<CR>")
map("n", "<leader>l", ":tabnext<CR>")
map("n", "<leader>q", ":tabclose<CR>")

map("n", "<F6>", ":vsplit <bar> terminal python %<CR>")

map("n", "<leader>f", ":lua require('fzf-lua').files( {previewer = false} )<CR>") --search cwd
map("n", "<leader>g", ":lua require('fzf-lua').live_grep()<CR>") --grep
map("n", "<leader>G", ":lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor
map("n", "<leader>Fr", ":lua require('fzf-lua').resume()<CR>") --last search

map("v", "<leader>i", "=gv") --auto indent
