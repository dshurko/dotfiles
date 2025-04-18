local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({
    source = "saghen/blink.cmp",
    depends = { "rafamadriz/friendly-snippets" },
    checkout = "v1.0.0",
  })

  require("blink.cmp").setup({
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    signature = { enabled = true },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },
  })
end)
