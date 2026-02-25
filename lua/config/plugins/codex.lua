return {
  'kkrampis/codex.nvim',
  lazy = true,
  cmd = { 'Codex', 'CodexToggle' }, -- Optional: Load only on command execution
  keys = {
    {
      '<leader>cc', -- Change this to your preferred keybinding
      function() require('codex').toggle() end,
      desc = 'Toggle Codex popup or side-panel',
      mode = { 'n', 't' }
    },
    -- Send selection (visual mode)
    {
      '<leader>cs',
      function() require('codex').actions.send_selection() end,
      desc = 'Codex: Send selection',
      mode = 'v', -- visual mode
    },
    -- Send file (normal mode)
    {
      '<leader>cf',
      function() require('codex').actions.send_file() end,
      desc = 'Codex: Send current file',
      mode = 'n',
    },
    -- Ask question (normal mode)
    {
      '<leader>ca',
      function() require('codex').actions.ask() end,
      desc = 'Codex: Ask a question',
      mode = 'n',
    },
  },
  opts = {
    keymaps     = {
      toggle = nil,          -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
      quit = '<C-q>',        -- Keybind to close the Codex window (default: Ctrl + q)
    },                       -- Disable internal default keymap (<leader>cc -> :CodexToggle)
    border      = 'rounded', -- Options: 'single', 'double', or 'rounded'
    width       = 0.8,       -- Width of the floating window (0.0 to 1.0)
    height      = 0.8,       -- Height of the floating window (0.0 to 1.0)
    model       = nil,       -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
    autoinstall = true,      -- Automatically install the Codex CLI if not found
    panel       = false,     -- Open Codex in a side-panel (vertical split) instead of floating window
    use_buffer  = false,     -- Capture Codex stdout into a normal buffer instead of a terminal buffer
  },
}
-- require('codex').status()    -- drop in to your lualine sections
