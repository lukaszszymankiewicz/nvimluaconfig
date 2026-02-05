local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader><leader>", ":noh<CR>")

map("i", "<c-c>", "<ESC>")
map("n", "<C-s>", ":wa<CR>")
map("i", "<C-s>", "<ESC> :wa<CR>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "Y", "y$")
map("n", ",", "$p")

map("n", "*", "*``")
map("n", "#", "#``")

map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

map("n", "<leader>h", ":tabprevious<CR>")
map("n", "<leader>l", ":tabnext<CR>")
map("n", "<leader>t", ":tabo<CR> :cclose<CR> <C-W>o")
map("n", "<leader>h", ":tabprevious<CR>")
map("n", "<leader>l", ":tabnext<CR>")
map("n", "<leader>q", ":tabclose<CR>")

map("n", "<F6>", ":vsplit <bar> terminal python %<CR>")
map("n", "<leader>=", ":!snow sql -f % --format=JSON_EXT > res <CR>")

map("n", "<leader>f", ":lua require('fzf-lua').files( {previewer = false} )<CR>") --search cwd
map("n", "<leader>g", ":lua require('fzf-lua').live_grep()<CR>") --grep
map("n", "<leader>G", ":lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor
map("n", "<leader>Fr", ":lua require('fzf-lua').resume()<CR>") --last search

map("n", "<leader>z", ":!echo % | pbcopy <CR><CR>")

map("n", "<Leader>rf", ":PythonCopyReferenceDotted<CR>")
map("n", "<Leader>pt", ":PythonCopyReferencePytest<CR>")
map("n", "<Leader>im", ":PythonCopyReferenceImport<CR>")

map("n", "<leader>p", ":NERDTreeToggle<CR>")
map("n", "<leader><CR>", "<C-^>zz")

map("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, {focus=true, scope='cursor'})<CR>", default_opts)
map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>n", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>", { noremap = true, silent = true })
map("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>", { noremap = true, silent = true })

map("n", "<C-F>", ":lua require('conform').format()<CR>")
map("n", "\\", "<C-w>w")

map("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>")
