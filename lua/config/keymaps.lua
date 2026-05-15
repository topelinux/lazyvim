-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

map("n", "<leader>2", '<cmd>let @+=expand("%:p")<cr>', { desc = "copy path" })
map("n", "WQ", "wq", { desc = "Fix WQ alias" })
map("n", "Wq", "wq", { desc = "Fix WQ alias" })
map("n", "<leader>3", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps by snask" })
map("n", "<leader>fa", "<cmd>Neotree toggle left reveal_force_cwd=true<CR>", { desc = "reveal in tree" })
map("n", "<leader>zh", ":edit ++enc=gb18030<CR>")
map("n", "<leader>gr", function()
  vim.lsp.buf.references()
end, { desc = "lsp references" })

map({ "n", "v" }, "<leader>y", '"*y', { desc = "copy to system" })
local modes = { "i", "x", "n", "s" }

for _, mode in ipairs(modes) do
  pcall(vim.keymap.del, mode, "<C-s>")
end
--map("n", "<leader>ss", '<cmd>setlocal spell!<cr>', { desc = "set spell" })
--vim.cmd([[
--nnoremap <silent> <leader>k <cmd> Man<CR>
--
--:command WQ wq
--:command Wq wq
--
--nnoremap <leader>2 :let @+=expand("%:p") <CR>
--
--map <leader>ss :setlocal spell!<cr>
--]])
