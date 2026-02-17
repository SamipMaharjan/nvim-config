vim.g.mapleader = " "

require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.diagnoistics")


-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
--   callback = function()
--     vim.opt.number = true
--     vim.opt.relativenumber = false
--   end,
-- })
