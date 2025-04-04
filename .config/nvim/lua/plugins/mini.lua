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
-- General workflow
--------------------------------------------------
later(function()
  require("mini.diff").setup({
    view = {
      style = "sign",
      signs = { add = "+", change = "~", delete = "-" },
    },
  })
end)

later(function()
  require("mini.files").setup()
end)

later(function()
  require("mini.git").setup()
end)

later(function()
  require("mini.pick").setup()
end)

--------------------------------------------------
-- Appearance
--------------------------------------------------
now(function()
  require("mini.icons").setup()
end)

now(function()
  require("mini.notify").setup()
end)

now(function()
  require("mini.statusline").setup()
end)
