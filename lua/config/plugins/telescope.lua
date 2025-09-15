return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or, branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "dist/" }
      },
      pickers = {
        find_files = { theme = 'ivy', hidden = true, no_ignore = true }
        -- live_grep  = {}
      }
      ,
      extensions = {
        fzf = {}
      }
    }
    require('telescope').load_extension('fzf')


    -- vim.keymap.set("n", "<space>fg", function()
    --   require('telescope.builtin').live_grep({
    --     additional_args = function()
    --       return { "--hidden" }
    --     end
    --   })
    -- end, { noremap = true, silent = true })
    vim.keymap.set("n", "<space>fo", require('telescope.builtin').oldfiles)
    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<space>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)
    require "config.telescope.multigrep".setup()
  end
}
