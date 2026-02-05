require('lint').linters_by_ft = {
    python = {'flake8'},
}

local lint = require('lint')

lint.linters.flake8 = {
  cmd = 'flake8',
  stdin = true,
  args = {
    '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
    '--no-show-source',
    '--max-line-length=130',
    '--max-doc-length=130',
    '--stdin-display-name',
    function() return vim.api.nvim_buf_get_name(0) end,
    '-',
  },
  ignore_exitcode = true,
  parser = require('lint.parser').from_pattern(
    '[^:]+:(%d+):(%d+):(%w+):(.+)',
    { 'lnum', 'col', 'code', 'message' },
    nil,
    {
      ['source'] = 'flake8',
      ['severity'] = vim.diagnostic.severity.WARN,
    }
  ),
}

-- Then enable linting on save or as you prefer
vim.api.nvim_create_autocmd({ "TextChanged", "BufEnter" }, {
  callback = function()
    lint.try_lint()
  end,
})
