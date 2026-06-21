# API

This page considers the details of using different features of the lua api.

## `vim.opt`

The `vim.opt` is designed to maniplate with options.

By using the `append`, `prepend`, `remove` methods of the subtables the configuration can be changed esily that if to acccess to it directly using `vim.o` api.

For example the code:

```lua
print(vim.o.rtp:sub(1,50))
```
<!-- nvim-lua-output:start -->
```text
/home/fedor/.config/nvim,/home/fedor/.local/share/
```
<!-- nvim-lua-output:end -->

Just prints the runtime path. However, it is a string type, so to edit it you need to implement concatenation/search/remove... operations by yourself.

The `vim.opt.rtp` allows this to be done automatically. For example, the following code adds the `/tmp` path at the beginning of the Lua runtime path:

```lua
vim.opt.rtp:prepend("/tmp")
print(vim.o.rtp:sub(1, 50))
```
<!-- nvim-lua-output:start -->
```text
/tmp,/home/fedor/.config/nvim,/home/fedor/.local/s
```
<!-- nvim-lua-output:end -->

The corresponding change appears in the `vim.o.rtp` because they are different interfaces for the same parameter.

## `vim.api`

NVim exposes general low level api. You can access it in lua code through `vim.api` table.

Check more in the [Api](https://neovim.io/doc/user/api/#API) page of the documentation.

---

For example the following cell uses the function `nvim_get_current_buf()` to retrieve the index and the function `nvim_buf_get_lines` the first few lines of the buffer:

```lua
curr_buffer = vim.api.nvim_get_current_buf()
print(curr_buffer)
print(vim.api.nvim_buf_get_lines(curr_buffer, 0, 3, false))
```
<!-- nvim-lua-output:start -->
```text
39
{ "# API", "", "This page considers the details of using different features of the lua api." }
```
<!-- nvim-lua-output:end -->

The result is literally the first lines of this document, because code was executed while the document was edited.
