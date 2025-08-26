vim.g.mapleader = " "
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true


-- QuickFix Keymaps
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>")

vim.diagnostic.config({
  virtual_text = true, -- Show error text inline
  signs = true,        -- Show error signs in gutter
  underline = true,    -- Show underlines
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>qq', ":tabclose<CR>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)

-- FOR ALT 1-0 TAB SWITCHING
for i = 1, 9 do
  vim.keymap.set('n', '<M-' .. i .. '>', '<cmd>tabn ' .. i .. '<CR>')
end
