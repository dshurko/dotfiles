local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({
    source = "saghen/blink.cmp",
    depends = { "rafamadriz/friendly-snippets" },
  })

  require("blink.cmp").setup({
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    fuzzy = {
      prebuilt_binaries = { force_version = "v1.0.0" },
    },
    signature = { enabled = true },
  })
end)
