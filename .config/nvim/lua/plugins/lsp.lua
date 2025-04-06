local add, now = MiniDeps.add, MiniDeps.now

now(function()
  local utils = require("utils")
  local map, map_leader = utils.map, utils.map_leader
  local lsp_picker = require("mini.extra").pickers.lsp

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
    },
  })
  require("lazydev").setup()

  map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  map("n", "gd", function()
    lsp_picker({ scope = "definition" })
  end, "[G]oto [D]efinition")
  map("n", "gi", function()
    lsp_picker({ scope = "implementation" })
  end, "[G]oto [I]mplementation")
  map("n", "gr", function()
    lsp_picker({ scope = "references" })
  end, "[G]oto [R]eferences")
  map("n", "gt", function()
    lsp_picker({ scope = "type_definition" })
  end, "[G]oto [T]ype Definition")
  map_leader("ds", function()
    lsp_picker({ scope = "document_symbol" })
  end, "[D]ocument [S]ymbols")
  map_leader("ws", function()
    lsp_picker({ scope = "workspace_symbol" })
  end, "[W]orkspace [S]ymbols")
  map_leader("ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map_leader("rn", vim.lsp.buf.rename, "[R]e[n]ame")
end)
