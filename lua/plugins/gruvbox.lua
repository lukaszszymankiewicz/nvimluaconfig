vim.o.background = "dark" -- or "light" for light mode

-- undercurl = true,
--
require("gruvbox").setup({
  terminal_colors = true,
  -- underline = true,
  -- bold = true,
  -- italic = {
  --   strings = false,
  --   emphasis = false,
  --   comments = false,
  --   operators = false,
  --   folds = false,
  -- },
  -- strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  -- palette_overrides = {},
  -- overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
