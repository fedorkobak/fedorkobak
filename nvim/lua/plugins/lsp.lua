return {
	{
		"neovim/nvim-lspconfig",
		config = function()
            vim.lsp.enable('pyright')
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end,
	},
}

