local now, later = MiniDeps.now, MiniDeps.later

--------------------------------------------------
-- Text editing
--------------------------------------------------
later(function()
	require("mini.ai").setup()
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
