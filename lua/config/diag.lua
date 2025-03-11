vim.diagnostic.config(
    {
        signs = true,
        virtual_text = false,
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
        underline = false,
        float = false,
    }
)
vim.o.signcolumn = "yes:1"
