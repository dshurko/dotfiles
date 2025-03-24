local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add("williamboman/mason.nvim")
  add("neovim/nvim-lspconfig")
  add("williamboman/mason-lspconfig.nvim")
  add("WhoIsSethDaniel/mason-tool-installer.nvim")
end)
