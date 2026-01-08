# `nvim` config

This folder contains my neovim configuration.

This file contains useful links and tips on configuration and usage.

Check the [user docs](https://neovim.io/doc/user/) in the official neovim site.

The **configuration file** is `~/.config/nvim/init.lua`.

Some basic configuration options:

- `vim.cmd("set expandtab")`: use spaces instead of tab.
- `vim.opt.clipboard = 'unnamedplus'` to only use the system clipboard and omit the internal vim configuration.
- `vim.opt.shiftwidth = 4`: amount of spaces to move the selected lines with `CTRL+</>`.
- `vim.opt.tabstop = 4`: amount of spaces to insert when the TAB is pressed in edit mode.

**Terminal**

- To open terminal use `:terminal` command.
- To start typing enter the edit mode, as usualy using `i`.
- To return to normal mode use `<C-/>,<C-n>` by default.

## Splits

This section looks at how you can split window in nvim.

- **Horizontal**: commands `split`, `sp`. Or `CTRL-w + s` short cut.
- **Vertical**: commands `vsplit`, `vsp`. Or `CTRL-w + v` short cut.

**Note.** You can pass the filename as an argument to commands `split` and `vsplit`. The correspoinding file will be opened in the new split.

To **switch splits** hold `CTRL-w` and use the typical vim motions buttons to navigate among them.

To **close** some of the splits you have options:

- `close` (`CTRL-w + c`) to close current section.
- `only` (`CTRL-w + o`) to leave just current section.


To change size of the split use:

- `CTRL-w + "+/-"`: to increase/decrease the size of the current section horizontally.
- `CTRL-w + "</>"`: to increase/decrease the size of the current section vertically.

## LSP

Neovim supports the lsp features check the [documentaion](https://neovim.io/doc/user/lsp.html).

Some important commands:

- [`vim.lsp.enable`](https://neovim.io/doc/user/lsp.html#vim.lsp.enable()) enables given lsp server. 
- [`vim.lsp.buf.type_definition()`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.type_definition()) jumps to the definition of the type of the object under cursor (`grt` default shortcut).
- [`vim.lsp.buf.references()`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.references()) shows all the mentions of the symbol under cursor in the special window (`grr` default shortcut).
- [`vim.diagnostics.open_float()`](https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.open_float()) opens the show diagnostics in the floating window. This means that if lsp or formatter marked some problem you can get additional inforamation in the floating window.

## Plugins

The plagins makes nvim experience really valuable. There are package managers, I'm using [Lazy](https://lazy.folke.io/).

Check the [installation](https://lazy.folke.io/installation) guide.

In the Lazy configuration file of the lazy (`~/.config/nvim/lua/lazy`), find the line that sets up lazy:

```lua
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  },
  install = { },
  checker = { enabled = true },
})
```

You have to list you plugins in the `spec` parameter.

### File browser

The filebrowser can be added to neovim using [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) plugin. To be able to see the icons of the files/folders in the files-tree, you have to specify the special font to your terminal I prefer [Lekton nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lekton.zip).

**Note.** To install the font copy it's `.ttf` files to the `~/.local/share/fonts`.

To open the file browser use the command `:Neotree filesystem reveal left`. Or add the keymap `vim.keymap.set('n', '<C-b>', ":Neotree filesystem reveal left<CR>", {})`.

