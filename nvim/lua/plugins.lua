return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
            local search = function()
                builtin.find_files({ hidden = true })
            end
			vim.keymap.set("n", "<C-p>", search, {})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})
            require("neo-tree").setup({
                  filesystem = {
                    filtered_items = {
                      visible = true,
                      hide_dotfiles = false,
                      hide_gitignored = false,
                    },
                },
            })
		end,
	},
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup{
                open_mapping = [[<C-t>]],
                direction = "horizontal",
                size = 12,
                insert_mappings = true,
                terminal_mappings = true,
            }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            vim.keymap.set(
                "n",
                "<C-g>",
                function()
                    require("gitsigns").preview_hunk()
                end,
                { desc = "Git preview hunk" }
            )
        end,
    },
}
