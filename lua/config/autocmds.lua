-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- 复制到系统剪贴板

    -- 删除到无名寄存器
    vim.keymap.set("n", "dd", '"dd', { silent = true })

    -- 可选：其他删除操作也使用无名寄存器
    vim.keymap.set({ "n", "v" }, "d", '"d', { silent = true })
  end,
})
