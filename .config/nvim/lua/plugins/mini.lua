local now, later = MiniDeps.now, MiniDeps.later

--------------------------------------------------
-- Text editing
--------------------------------------------------
later(function()
  local spec_treesitter = require("mini.ai").gen_spec.treesitter
  require("mini.ai").setup({
    custom_textobjects = {
      c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
      F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
      o = spec_treesitter({
        a = { "@conditional.outer", "@loop.outer" },
        i = { "@conditional.inner", "@loop.inner" },
      }),
    },
    n_lines = 500,
  })
end)

later(function()
  require("mini.pairs").setup()
end)

later(function()
  require("mini.surround").setup()
end)

--------------------------------------------------
-- Appearance
--------------------------------------------------
now(function()
  require("mini.icons").setup()
end)

now(function()
  require("mini.statusline").setup()
end)
