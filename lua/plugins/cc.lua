require("codecompanion").setup({
    rules = {
    python = {
      description = "Common Python rules",
      files = {
        "pyrules.md",
      },
      is_preset = true,
    },
    opts = {
      chat = {
        autoload = "default",
        enabled = true,
      },
    },
  },
  interactions = {
    chat = {
      adapter = "gemini",
      model = "gemini-2.5-flash-lite",
      slash_commands = {
        ["file"] = {
          opts = { provider = "fzf_lua" },
          keymaps = { modes = { i = "<C-f>", n = "gf" } },
        },
        ["rules"] = {
          keymaps = { modes = { n = "gr" } },
        },
    },
    },
    inline = {
      adapter = "gemini",
      model = "gemini-3-flash-preview"
    },
  },
  log_level = "ERROR",
})

