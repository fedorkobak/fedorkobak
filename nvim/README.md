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
- To return to normal mode use `<C-\>,<C-n>` by default.

## Shortcuts

You are supposed to configure the shortcuts for the nvim editor.

Do this with lua function command:

```lua
vim.keymap.set(mode, shortcut, command)
```

Where:

- `mode`: modes where the shortcut would be available (`n`, `e`, `v` etc.). 
- `shortcut`: the shortcut you want to set up.
- `command`: the command the shortcut will execute.

**Note**. In shortcuts you can use the special `<leader>` key, which is the special key for shortcuts configured for this user. By default, the `<leader>` is equivalent to space.

## Splits

This section looks at how you can split window in nvim.

- **Horizontal**: commands `split`, `sp`. Or `CTRL-w + s` short cut.
- **Vertical**: commands `vsplit`, `vsp`. Or `CTRL-w + v` short cut.

**Note.** You can pass the filename as an argument to commands `split` and `vsplit`. The correspoinding file will be opened in the new split.

To **switch between splits**, press `Ctrl-w` and then use the standard Vim motion keys (`h`, `j`, `k`, `l`) to move between windows.

Under the hood, `Ctrl-w` invokes Vim’s built-in `:wincmd` dispatcher. The following key (`h`, `j`, `k`, or `l`) is passed as an argument to `:wincmd`, which performs the corresponding window move (left, down, up, or right).

To **close** some of the splits you have options:

- `close` (`CTRL-w + c`) to close current section.
- `only` (`CTRL-w + o`) to leave just current section.


To change size of the split use:

- `CTRL-w + "+/-"`: to increase/decrease the size of the current section horizontally.
- `CTRL-w + "</>"`: to increase/decrease the size of the current section vertically.

## LSP

Neovim supports the lsp features check the [documentaion](https://neovim.io/doc/user/lsp.html).

To restart the LSP use command `:LspRestart`.

Some important commands:
- [`vim.lsp.enable`](https://neovim.io/doc/user/lsp.html#vim.lsp.enable()) enables given lsp server. 
- [`vim.lsp.buf.definition`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.definition()) go to the definition of the given object (`gd` in this configuration is mapped for this command).
- [`vim.lsp.buf.type_definition`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.type_definition()) jumps to the definition of the type of the object under cursor (`grt` default shortcut).
- [`vim.lsp.buf.references`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.references()) shows all the mentions of the symbol under cursor in the special window (`grr` default shortcut).
- [`vim.lsp.buf.hover`](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.hover()) shows a hover window that contains the information about the symbol under the cursor (`K` to show the hover, `KK` to enter the hover and navigate inside it like in regular window).
- [`vim.diagnostics.open_float`](https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.open_float()) opens the show diagnostics in the floating window. This means that if lsp or formatter marked some problem you can get additional inforamation in the floating window. The `<shit-e>` is mapped to this opperation in configuration. 

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


## Jumps

Jumps are a movements between different part of a text, according to a certain rules.

The jumps could be:

- Move to line `:<number of the line>`.
- Different lsp related movements: `grt`, `grr` and so on.
- When search brings you to some line.

Check the list of your jumps with the command `:jumps`.

You can go to the previous jump by `<C-o>`, or to the next one by pressing `<C-i>`.

## Search and replace

To **search** in vim just type `/<symbols combo to search>`. As you type, it will move you to the first occurrence below the cursor. It will also highlight all other instances of the search pattern. After pressing `Enter`, the cursor will move to the closest match below. You can move to the next match by pressing `n` and to the previous match by pressing `N`.

To **replace** values in vim, you have to use a command like:

```
:<scope>\<value to be replaced>\<value to replace>\<parameters>
```

The most usefull command are represented in the following table:

| Command                         | Description                                                   |
|--------------------------------|---------------------------------------------------------------|
| `:s/foo/bar/`                  | Replace first occurrence of `foo` with `bar` on the current line |
| `:s/foo/bar/g`                | Replace **all** occurrences of `foo` with `bar` on the current line |
| `:%s/foo/bar/`                | Replace first occurrence of `foo` with `bar` in **all lines**     |
| `:%s/foo/bar/g`              | Replace all occurrences of `foo` with `bar` in the whole file  |
| `:%s/foo/bar/gc`             | Same as above, but **ask for confirmation** before each change |
| `:n,m s/foo/bar/g`           | Replace `foo` with `bar` between lines `n` and `m`             |
| `:'<,'> s/foo/bar/g`         | Replace `foo` with `bar` in the selected in visual mode section. VSCode automatically adds `'<,'>` to the command line when you type `:` in visual mode. |
| `:%s/\<foo\>/bar/g`          | Replace whole word `foo` with `bar` globally                   |
| `:%s/foo/bar/gI`             | Replace `foo` with `bar` globally, **case-insensitive**         |
| `:%s/foo\c/bar/g`            | Also case-insensitive (with `\c` in pattern)                   |
| `:%s/\Vfoo/bar/g`            | Use **very magic** mode (fewer escapes needed in pattern)      |

Use backslash symbol to escape a symbol in a pattern. For example, to replace the pattern `/test` with `hello`, use the command:

```
:s/\/test/hello/
```

To escape a backslash itlself, use the `\\` combination before it. So, to replace the pattern `\$` with `$`:

```
:s/\\\$/$/
```

To enter to the search mode for the selected text in the visual mode, press `*` (`<Shirt-8>` key).

## Debugger

The way to use debugger with neovim is by using [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) plugin.

This configuration uses:

- `<F5>` to start debugger/continue execution.
- `<F10>, <F11>, <F12>`: step over, step into and step out respectively.
- `<leader>b` to set the break point.
- `<leader>dr` opens the dap window, where you can type the variables whose values you want to inspect.

**Note.** The [`debugpy`](https://github.com/microsoft/debugpy) have to be installed in the environment to use dap.
