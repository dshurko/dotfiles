local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add("stevearc/conform.nvim")

  require("conform").setup({
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      sh = { "shfmt" },
      sql = { "sqlfluff" },
    },
    formatters = {
      sqlfluff = {
        args = { "format", "-" },
      },
    },
    format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
  })
end)
