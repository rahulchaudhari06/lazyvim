return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
        "flake8",
        "black",
        "cspell",
        "jq",
        "markdownlint",
        "pyright",
        "prettier",
        "ruff",
      },
    },
  },
}
