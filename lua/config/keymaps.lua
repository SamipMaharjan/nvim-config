-- QuickFix Keymaps
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>")

-- leader keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>qu', ":q<CR>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>ho", ":noh<CR>")
vim.keymap.set('n', '<leader>qa', ":qa<CR>")
vim.keymap.set("n", "<leader>wr", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")

-- FOR ALT 1-0 TAB SWITCHING
for i = 1, 9 do
  vim.keymap.set('n', '<M-' .. i .. '>', '<cmd>tabn ' .. i .. '<CR>')
end
