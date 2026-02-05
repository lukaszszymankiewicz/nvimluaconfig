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
