
local lsp = require('lspconfig')

vim.g.coq_settings = {
    auto_start = 'shut-up',
    ['display.icons.mode'] = 'none',
    ['completion.always'] = false,
    ['display.preview.enabled'] = false,
    ['display.ghost_text.enabled'] = false,
    ['display.preview.border'] = "solid"
}

local coq = require('coq')

require'lspconfig'.jedi_language_server.setup(coq.lsp_ensure_capabilities())

vim.keymap.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({ float = false })

vim.keymap.set("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
