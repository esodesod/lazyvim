return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- Use the global config so md013 (line-length) is disabled for all
          -- markdown files; project .markdownlint.yaml still overrides it.
          args = {
            "--config",
            vim.fn.expand("~/.config/nvim/markdownlint.yaml"),
            "-",
          },
        },
      },
    },
  },
}
