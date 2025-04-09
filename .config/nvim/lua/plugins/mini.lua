local now, later = MiniDeps.now, MiniDeps.later
local map_leader = require("utils").map_leader

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
  require("mini.extra").setup()
end)

later(function()
  require("mini.files").setup({
    mappings = { close = "<Esc>" },
  })
end)

later(function()
  require("mini.git").setup()
end)

later(function()
  require("mini.pick").setup()

  vim.ui.select = require("mini.pick").ui_select

  map_leader("n", "f/", '<Cmd>Pick buf_lines scope="current"<CR>', "[F]ind in current buffer (enhanced [/])")
  map_leader("n", "f:", '<Cmd>Pick history scope=":"<CR>', "[F]ind command history (enhanced [:])")
  map_leader("n", "fa", function()
    require("mini.pick").builtin.cli({
      command = { "fd", "--hidden", "--no-ignore", "--exclude", ".git", "--type", "file" },
    })
  end, "[F]ind [A]ll files (including hidden)")
  map_leader("n", "fb", "<Cmd>Pick buffers<CR>", "[F]ind [B]uffers")
  map_leader("n", "ff", "<Cmd>Pick files<CR>", "[F]ind [F]iles")
  map_leader("n", "fg", "<Cmd>Pick grep_live<CR>", "[F]ind by [G]rep")
  map_leader("n", "fh", "<Cmd>Pick help<CR>", "[F]ind [H]elp")
  map_leader("n", "fk", "<Cmd>Pick keymaps<CR>", "[F]ind [K]eymaps")
  map_leader("n", "fn", function()
    require("mini.pick").builtin.files({}, { source = { cwd = vim.fn.stdpath("config") } })
  end, "[F]ind [N]eovim config files")
  map_leader("n", "fo", "<Cmd>Pick oldfiles<CR>", "[F]ind [O]ld files")
  map_leader("n", "fr", "<Cmd>Pick resume<CR>", "[F]ind [R]esume last picker")
  map_leader("n", "fw", '<Cmd>Pick grep pattern="<cword>"<CR>', "[F]ind [W]ord under cursor")
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
