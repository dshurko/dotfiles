return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: [A]dd current file to marks" })
		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: [E]dit marks" })

		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Jump to mark 1" })
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Jump to mark 2" })
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Jump to mark 3" })
		vim.keymap.set("n", "<leader>;", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Jump to mark 4" })

		vim.keymap.set("n", "<leader>p", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Jump to [p]revious mark" })
		vim.keymap.set("n", "<leader>n", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Jump to [n]ext mark" })
	end,
}

-- vim: ts=2 sts=2 sw=2 et
