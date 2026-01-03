-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

map("n", "<leader>2", '<cmd>let @+=expand("%:p")<cr>', { desc = "copy path" })
map("n", "WQ", 'wq', { desc = "Fix WQ alias" })
map("n", "Wq", 'wq', { desc = "Fix WQ alias" })
map("n", "<leader>3", function() Snacks.picker.keymaps() end, { desc = "Keymaps by snask" })
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
