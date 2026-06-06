# `nvim` config

This folder contains my neovim configuration.

This file contains useful links and tips on configuration and usage.

Check:
- The [user docs](https://neovim.io/doc/user/) in the official neovim site.
- The [user manual](https://neovim.io/doc/user/usr_toc/#user-manual).

The **configuration file** is `~/.config/nvim/init.lua`.

Some basic configuration options:

- `vim.cmd("set expandtab")`: use spaces instead of tab.
- `vim.opt.clipboard = 'unnamedplus'` to only use the system clipboard and omit the internal vim configuration.
- `vim.opt.shiftwidth = 4`: amount of spaces to move the selected lines with `CTRL+</>`.
- `vim.opt.tabstop = 4`: amount of spaces to insert when the TAB is pressed in edit mode.


**Run lua code** from the nvim command using `lua` at the beggining. For example:

```lua
lua print("hello world")
```

## Windows

Nvim can handle multiple documents simualtaneosly. This is achieved through the following features:

- **Buffers**: the representation of the file in nvim.
- **Window**: represents the buffer in interface.
- **Tab**: the collection of the windows.

Check the [Windows](https://neovim.io/doc/user/windows/) section of the user manual.

### Buffers

In vim buffers are in-memory representations of files or content. Bufferes are:

- Each file you've opened with nvim.
- The terminal sessions.

The following nvim commands are associated with buffers:

- `:ls`: list available buffers.
- `:buffer <number>` or `b <number>`: to open the corresponding buffer in the tab.

### Windows

This section looks at how you can split nvim working area into windows.

Shortcuts for manipulating windowns in nvim typically start with `CTRL-w`.

**Split (create)** windows:

- **Horizontal**: commands `split`, `sp`. Or `CTRL-w s` shortcut.
- **Vertical**: commands `vsplit`, `vsp`. Or `CTRL-w v` shortcut.
- **Close** the window with `:q` or `CTRL-w q` shortcut.

**Note.** You can pass the filename as an argument to commands `split` and `vsplit`. The correspoinding file will be opened in the new split.

To **switch between splits**, press `Ctrl-w` and then use the standard Vim motion keys (`h`, `j`, `k`, `l`) to move between windows.

Under the hood, `Ctrl-w` invokes Vim’s built-in `:wincmd` dispatcher. The following key (`h`, `j`, `k`, or `l`) is passed as an argument to `:wincmd`, which performs the corresponding window move (left, down, up, or right).

To **close** some of the splits you have options:

- `close` (`CTRL-w + c`) to close current section.
- `only` (`CTRL-w + o`) to leave just current section.

To **change size** of the split use:

- `CTRL-w + "+/-"`: to increase/decrease the size of the current section horizontally.
- `CTRL-w + "</>"`: to increase/decrease the size of the current section vertically.
- **Note** nvim supporst resizing with mouse, in post cases this is the most convenient option.

The commands `CTRL-W H`, `CTRL-W J`, `CTRL-W K`, and `CTRL-W L` move the current window to the far left, bottom, top, or right of the window layout, respectively. They are disabled in my configuration because they ussually exhibit confusing and not revertable behaviour when CapsLock is activated.

Check the [Splitting windows](https://neovim.io/doc/user/usr_08/#usr_08.txt) of the vim manual.

### Tabs

Create tabs that keep other documents and switch between them. Use teh `:tab split` command to reopen the current file in a new tab. To switch between tabs use: 

- The `<C+S+PgUp>`, `<C+S+PgDown>` shortcuts, but these uslually conflict with internal terminal tabs.
- The `<g+t>`, `<g+T>` default nvim combination for switching tabs.

## Modes

**Visual** the mode in which you can select some text. It supports following features:

- **Blocked Visual Mode**: activate blocked visual mode with the capital letter `V` and you will be able to select individual columns rather than whole lines.
- **Move inside selected**: if you need to select more on the other side of the selection, there is no need to recreate the visual block. Just move to the end with the `o` letter.

**Visual blocked** is a variation of the visual mode that allows you to select a block of text without having to select each line up to the end. This approach provides some features associated with completing repetative oparations on the different lines:

- Enter insert mode with `I` and text added in the first line would be added in all lines.
- Entering insert mode with `A` works the same but insert new text at the right sight of the selected area. 
- With `c` command the selected block would be removed, and the typed text would be substituted in the each line.

**Terminal**

- To open terminal use `:terminal` command.
- To start typing enter the edit mode, as usualy using `i`.
- To return to normal mode use `<C-\>,<C-n>` by default (Changed to `<C-w><Esc>` in my configuration).
- This configuration uses [`akinsho/toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim) plugin to manage terminal. Open the toggleterm with ```<C-`>``` command (which is for unknown reason is equivalent to the `<C-Space>`).

**Replacing**

Enter the replacing mode with the capital `R`. All characters you type, replace the characters under the cursor.

## Vim motions

Vim's true power is its special text navigation system. Many popular code/text editors support extentions that emulate the Vim behaviour. While most are really obvious, some are more subtle and easy to overlook, os this section explores usefull tricks associated with using the Vim navigation system:

- **Paired brackets**: keep the cursor in the normal mode in the bracked the `%` (`<C-5>`) moves the cursor to the paired bracked.
- **Repeating insert**: If you type the number before entering the insert mode, when you return to the normal mode, the text you're inserting will be repeated the specified number of times. It's a typical thing for me to do occasionally, but the usful case `80i=<ESC>` allows you to put 80 `=` in a row, which is usefull for building visual separators in the plain text.
- **Exit file**: use `ZZ` (`shift + z, shift + z`) to save the file and automatically close it.
- **Moving to a character**: with the `f` command, you can jump to the specified symbol on the current line. This is not really useful with regular text symbols, but programming and formal languages typically have some kind of special symbols. For example, jump from the begining to the end of the cycle definition in the line `for i in range(10): print(i)`, use `f:`.
    - To go to symbol backwards use capital `F`.
    - To go to the symbol that previous before the specified symbol use `t` and `T` respectively.
- **Goto line**.
    - Type number of the line + enter.
    - Type `<number%> + <CR>`  to go to the specified procent of the lines.
    - `gg` to the first line and `G` to the last.
- **Relatively to screen** if you need to scroll past the visible area, there is an option to scroll relative to the number of lines visible in the working area:
    - `<PgUp>`, `<PgDown>` to scroll one screen.
    - `<C-d>`, `<C-u>` to scroll half of the screen **d**own and **u**p respectively.
- **Scrooll** if you need to scrooll the visible text without changing the possition of the cursor:
    - `<C-y>`/`<C-e>` to scroll one line up/down.

Check the [chapter 2](https://neovim.io/doc/user/usr_02/#usr_02.txt) and [chapter3](https://neovim.io/doc/user/usr_03/#usr_03.txt) of the vim quick start to learn more about basic motions features.

### Jumps

Jumps are a movements between different part of a text, according to a certain rules.

The jumps could be:

- Move to line `:<number of the line>`.
- Different lsp related movements: `grt`, `grr` and so on.
- When search brings you to some line.

Check the list of your jumps with the command `:jumps`.

You can go to the previous jump by `<C-o>`, or to the next one by pressing `<C-i>`.

### Macros

You can record the actions you did and apply in some other place.

The following keys are responsble for building macroses:

- Start recording a macro with `q{register}`. The `{register}` is a letter which is used to name this macro.
- Finish recording with `q`.
- Apply the macro with `@{register}` and vim will perform the same actions that you performed during the recording.

**Note** that the registers are the same for yanking and macros. Macros are simply recorded into the regular register as a plain text. You can therefore pasate macros and return them to the register.

You can add the commands to the existing macros by invoking the recording for capital register. For example to append actions to the register `a` use `qA` command.

Check more in the [Record and playback commands](https://neovim.io/doc/user/usr_10/#10.1) section of the user manual.

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

**Special keys** are shortcuts that are usually wrapped in `<>` brackets. The following table shows the denotations for common keys used in key combinations.

| Key          | Notation        |
| ------------ | --------------- |
| Enter        | `<CR>`          |
| Escape       | `<Esc>`         |
| Tab          | `<Tab>`         |
| Backspace    | `<BS>`          |
| Space        | `<Space>`       |
| Leader key   | `<leader>`      |
| Local leader | `<localleader>` |

**Modifier keys** The Ctrl, Alt and Shift keys are considered as modifyer keys, so they can only be used in combination with other keys. They must be refereneced as follows: `<C-{key}>`, `<A-{key}>`, `<S-{key}>`.

| Key          | Notation        |
| ------------ | --------------- |
| Shift        | `<S+{key}>`     |
| Ctrl         | `<C+{key}>`     |
| Alt          | `<A+{key}>`     |


**Note**. In shortcuts you can use the special `<leader>` key, which is the special key for shortcuts configured for this user. By default, the `<leader>` is equivalent to space.


## Registers

Vim contains several clipboards, which are called 'registers'. They have names composed of one symbol. The default register is named `"`, and anything that is yanked, deleted or replaced appeared in this register.

You can select the registry to use by entering a command that begins with the `"` symbol. Then specify the registry you want to use and the specific command you want to apply:

For example:

- `"1y` to yank the text to the register called `1`.
- `"1p` to pase the text from the register called `1`.

This would work with any command related with copying/pasting.

Check the "Using registers" seciton of the [Copy text between files](https://neovim.io/doc/user/usr_07/#07.5) chapter of the vim manual.

The [telescope](https://github.com/nvim-telescope/telescope.nvim) has a great feature for the registers. View your registers with the `:Telescope registers` command.

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

### Telescope

Is a great plugin that allows to search for the files within the project.

- `Telescope find_files` to look for the files in project. Mapped to `<C-p>`.
- `Telescope regiesters` to view the contents of the registers.

Open the searched result in a **new split or tab**:

- `<C-x>` to open in a new horizontal split.
- `<C-v>` to open in a new vertical split.
- `<C-t>` to open in a new tab.

### File browser

The filebrowser can be added to neovim using [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) plugin. To be able to see the icons of the files/folders in the files-tree, you have to specify the special font to your terminal I prefer [Lekton nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lekton.zip).

**Note.** To install the font copy it's `.ttf` files to the `~/.local/share/fonts`.

To open the file browser use the command `:Neotree filesystem reveal left`. Or add the keymap `vim.keymap.set('n', '<C-b>', ":Neotree filesystem reveal left<CR>", {})`.

## Search and substitute

To **search** in vim just type `/<symbols combo to search>`. As you type, it will move you to the first occurrence below the cursor. It will also highlight all other instances of the search pattern. After pressing `Enter`, the cursor will move to the closest match below. You can move to the next match by pressing `n` and to the previous match by pressing `N`.

Check the [search](https://neovim.io/doc/user/usr_03/#03.8) section of the vim tutorial.

To specify in search that you need to look only **complete words** not wrapped by other next use `\<` and `\>` symbols.

The idea is represented in the following exampler:

```
anthem
for them  <- /\<the
now the <- /\<the\>
```

The pattern specified after the `<-` symbol means that that search command will refer to the corresponding line.

To enter to the search mode for the selected text in the visual mode, press `*` (`<Shirt-8>` key).

### Substitute

To **replace** values in vim, you have to use a command like:

```
:[range]substitute/<value to be replaced>/<value to replace>/[flags]
```

The `substitute` command by default have `s` as alias.

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

**Note**: the characters `.*[]^%/\?~$` have a special meaning, so all they have to be escaped in commands and searches.

There are following usefull flags:

- `g`: to apply the substitution globally. By default, it replaces only the first occurance.
- `c`: to ask the confirmation for substitutions.

Check the official description in the [Substitution](https://neovim.io/doc/user/usr_10/#10.2) section of the official documentation.

## Debugger

The way to use debugger with neovim is by using [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) plugin.

This configuration uses:

- `<leader>dc`, `<leader>dn`, `<leader>di`, `<leader>do`: continue, step over, step into and step out respectively.
- `<leader>b` to set the break point.
- `<leader>dr` opens the dap window, where you can type the variables whose values you want to inspect.

A terminal is automatically created for each debugging session. It stores messages from the processe's stdout. Use the `:ls` command to show all available buffers; the buffer created for the DAP will have the `[dap-terminal]` in it's name. Use the command `:b <number>` to open the corresponding buffer.

**Note.** The [`debugpy`](https://github.com/microsoft/debugpy) have to be installerd in the environment to use dap.

## vimscrip configuration

Sometimes it's useful to have the same configuration in vimscrip style rather than lua style. This is useful as some other tools contain facilities to build vim-like workflows and they sometimes the vim scirpt. So here is listed configuration for vim-script that I use:

```vim
set relativenumber
set clipboard=unnamedplus
```
