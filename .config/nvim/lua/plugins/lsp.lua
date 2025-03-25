local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add("folke/lazydev.nvim")
  add("williamboman/mason.nvim")
  add("williamboman/mason-lspconfig.nvim")
  add("WhoIsSethDaniel/mason-tool-installer.nvim")
  add("neovim/nvim-lspconfig")

  require("lazydev").setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    },
  })
  require("mason-tool-installer").setup({
    ensure_installed = {
      -- LSP
      "bashls",
      "clangd",
      "lua_ls",
      "pyright",

      -- Linters and formatters
      -- "ruff",

      -- DAP
    },
  })
end)
