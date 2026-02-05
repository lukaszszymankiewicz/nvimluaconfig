require("conform").setup({
  formatters_by_ft = {
    python = {
        "autoflake",
        "isort",
        "black" 
    },
  },
})

require("conform").formatters.black = {
  prepend_args = {
    "--line-length=130" 
    },
}

require("conform").formatters.autoflake = {
  prepend_args = {
    "--remove-all-unused-imports"
    },
}

require("conform").formatters.isort = {
  prepend_args = {
    "--line-length=130" 
    },
}
