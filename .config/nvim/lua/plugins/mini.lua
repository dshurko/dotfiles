local now, later = MiniDeps.now, MiniDeps.later

-- Appearance
now(function()
	require("mini.icons").setup()
end)

now(function()
	require("mini.statusline").setup()
end)
