-- mini.nvim:

return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.statusline').setup()
      require('mini.surround').setup({
        mappings = {
          add = "sa",            -- Add surrounding
          delete = "sd",         -- Delete surrounding
          replace = "sr",        -- Replace surrounding
          find = "sf",           -- Find surrounding (to the right)
          find_left = "sF",      -- Find surrounding (to the left)
          highlight = "sh",      -- Highlight surrounding
          update_n_lines = "sn", -- Update search n_lines
          suffix_last = "l",     -- Suffix to search with "last"
          suffix_next = "n",     -- Suffix to search with "next"
        },
      })
    end,
  },
}
