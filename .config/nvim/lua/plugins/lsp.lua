local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add("neovim/nvim-lspconfig")
  add("williamboman/mason.nvim")
  add("williamboman/mason-lspconfig.nvim")
  add("WhoIsSethDaniel/mason-tool-installer.nvim")
  add("folke/lazydev.nvim")

  require("mason").setup()
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
    },
  })
  require("mason-tool-installer").setup({
    ensure_installed = {
      -- LSP (Language Server Protocol)
      "bashls",
      "clangd",
      "lua_ls",
      "pyright",

      -- Linters and formatters
      "clang-format",
      "ruff",
      "shellcheck",
      "shfmt",
      "stylua",

      -- DAP (Debug Adapter Protocol)
    },
  })
  require("lazydev").setup()
end)
