-- mini.nvim:

return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.statusline').setup()
      require('mini.surround').setup({
        add = "gsa",      -- Add surrounding
        delete = "gsd",   -- Delete surrounding
        replace = "gsr",  -- Replace surrounding
        find = "gsf",     -- Find surrounding
        highlight = "gsh" -- Highlight surrounding
      })
    end,
  },
}
