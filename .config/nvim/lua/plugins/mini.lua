local now, later = MiniDeps.now, MiniDeps.later
local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

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

  map_leader("n", "go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "[G]it diff [O]verlay")

  local rhs = function()
    return MiniDiff.operator("yank") .. "gh"
  end
  map("n", "ghy", rhs, "[G]it [H]unk [Y]ank reference", { expr = true, remap = true })
end)

later(function()
  require("mini.extra").setup()
end)

later(function()
  require("mini.files").setup()

  -- Toggle explorer
  local minifiles_toggle = function(...)
    if MiniFiles.close() == nil then
      MiniFiles.open(...)
    end
  end

  map("n", "-", minifiles_toggle, "Toggle file explorer [-]")

  -- Show/hide dot-files
  local show_dotfiles = true

  local filter_show = function(fs_entry)
    return true
  end

  local filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, ".")
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  -- Yank in register full path of entry under cursor
  local yank_path = function()
    local path = (MiniFiles.get_fs_entry() or {}).path
    if path == nil then
      return vim.notify("Cursor is not on valid entry")
    end
    vim.fn.setreg(vim.v.register, path)
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
      local buf_id = args.data.buf_id
      map("n", ".", toggle_dotfiles, "Toggle [.]dotfiles", { buffer = buf_id })
      map("n", "Y", yank_path, "[Y]ank path", { buffer = buf_id })
    end,
  })
end)

later(function()
  require("mini.git").setup()

  local git_log_cmd = [[Git log --graph --topo-order --pretty=format:\%h\ \%as\ │\ \%s\%d]]

  -- Status and information
  map_leader("n", "gS", "<Cmd>Git status<CR>", "[G]it [S]tatus")
  map_leader({ "n", "x" }, "gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "[G]it [S]how context")

  -- Viewing changes
  map_leader("n", "gd", "<Cmd>Git diff<CR>", "[G]it [D]iff unstaged")
  map_leader("n", "gD", "<Cmd>Git diff -- %<CR>", "[G]it [D]iff unstaged file")
  map_leader("n", "ga", "<Cmd>Git diff --cached<CR>", "[G]it st[A]ged diff")
  map_leader("n", "gA", "<Cmd>Git diff --cached -- %<CR>", "[G]it st[A]ged diff file")

  -- History
  map_leader("n", "gl", "<Cmd>" .. git_log_cmd .. "<CR>", "[G]it [L]og")
  map_leader("n", "gL", "<Cmd>" .. git_log_cmd .. " --follow -- %<CR>", "[G]it [L]og file")

  -- Making changes
  map_leader("n", "gc", "<Cmd>Git commit<CR>", "[G]it [C]ommit")
  map_leader("n", "gC", "<Cmd>Git commit --amend<CR>", "[G]it [C]ommit amend")

  -- Git pickers
  map_leader("n", "gf", "<Cmd>Pick git_commits<CR>", "[G]it [F]ind commits")
  map_leader("n", "gF", "<Cmd>Pick git_commits path='%'<CR>", "[G]it [F]ind file commits")
  map_leader("n", "gb", "<Cmd>Pick git_branches<CR>", "[G]it [B]ranches")
  map_leader("n", "gh", "<Cmd>Pick git_hunks<CR>", "[G]it [H]unks")

  -- Full interface
  map_leader("n", "gg", "<Cmd>terminal lazygit<CR>i", "[G]it [G]UI (Lazygit)")
end)

later(function()
  require("mini.pick").setup()

  vim.ui.select = MiniPick.ui_select

  -- File navigation
  map_leader("n", "ff", "<Cmd>Pick files<CR>", "[F]ind [F]iles")
  map_leader("n", "fb", "<Cmd>Pick buffers<CR>", "[F]ind [B]uffers")
  map_leader("n", "fo", "<Cmd>Pick oldfiles<CR>", "[F]ind [O]ld files")
  map_leader("n", "fa", function()
    MiniPick.builtin.cli({ command = { "fd", "--hidden", "--no-ignore", "--exclude", ".git", "--type", "file" } })
  end, "[F]ind [A]ll files (including hidden)")
  map_leader("n", "fn", function()
    MiniPick.builtin.files({}, { source = { cwd = vim.fn.stdpath("config") } })
  end, "[F]ind [N]eovim config files")

  -- Text search
  map_leader("n", "fg", "<Cmd>Pick grep_live<CR>", "[F]ind by [G]rep")
  map_leader("n", "fw", '<Cmd>Pick grep pattern="<cword>"<CR>', "[F]ind [W]ord under cursor")
  map_leader("n", "f/", '<Cmd>Pick buf_lines scope="current"<CR>', "[F]ind in buffer (enhanced [/])")

  -- Other
  map_leader("n", "fh", "<Cmd>Pick help<CR>", "[F]ind [H]elp")
  map_leader("n", "fk", "<Cmd>Pick keymaps<CR>", "[F]ind [K]eymaps")
  map_leader("n", "f:", '<Cmd>Pick history scope=":"<CR>', "[F]ind command history (enhanced [:])")
  map_leader("n", "fr", "<Cmd>Pick resume<CR>", "[F]ind [R]esume last picker")
end)

--------------------------------------------------
-- Appearance
--------------------------------------------------
later(function()
  require("mini.cursorword").setup()
end)

now(function()
  require("mini.icons").setup()
end)

later(function()
  require("mini.indentscope").setup()
end)

now(function()
  require("mini.notify").setup()

  vim.notify = MiniNotify.make_notify()
end)

now(function()
  require("mini.statusline").setup()
end)
