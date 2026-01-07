# `nvim` config

This folder contains my neovim configuration.

This file contains useful links and tips on configuration and usage.

The **configuration file** is `~/.config/nvim/init.lua`.

Some basic configuration options:

- `vim.cmd("set expandtab")`: use spaces instead of tab.
- `vim.opt.clipboard = 'unnamedplus'` to only use the system clipboard and omit the internal vim configuration.
- `vim.opt.shiftwidth = 4`: amount of spaces to move the selected lines with `CTRL+</>`.
- `vim.opt.tabstop = 4`: amount of spaces to insert when the TAB is pressed in edit mode.

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

