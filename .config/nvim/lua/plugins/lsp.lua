local add, now = MiniDeps.add, MiniDeps.now
local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

now(function()
  add("williamboman/mason.nvim")
  add("williamboman/mason-lspconfig.nvim")
  add("neovim/nvim-lspconfig")
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
    },
  })
  require("lazydev").setup()

  map("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>", "[G]oto [D]eclaration")
  map("n", "gI", "<Cmd>Pick lsp scope='implementation'<CR>", "[G]oto [I]mplementation")
  map("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>", "[G]oto [D]efinition")
  map("n", "gr", "<Cmd>Pick lsp scope='references'<CR>", "[G]oto [R]eferences")
  map_leader("n", "D", "<Cmd>Pick lsp scope='type_definition'<CR>", "Type [D]efinition")
  map_leader("n", "ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map_leader("n", "dd", '<Cmd>Pick diagnostic scope="current"<CR>', "[D]iagnostics in current [D]ocument")
  map_leader("n", "ds", "<Cmd>Pick lsp scope='document_symbol'<CR>", "[D]ocument [S]ymbols")
  map_leader("n", "dw", '<Cmd>Pick diagnostic scope="all"<CR>', "[D]iagnostics in [W]orkspace")
  map_leader("n", "rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map_leader("n", "ws", "<Cmd>Pick lsp scope='workspace_symbol'<CR>", "[W]orkspace [S]ymbols")
end)
