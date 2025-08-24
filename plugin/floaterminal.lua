vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buf = -1,
    win = -1
  }
}
local function create_floating_window(opts)
  opts = opts or {}
  local width_ratio = opts.width or 0.8   -- 80% of screen width
  local height_ratio = opts.height or 0.8 -- 80% of screen height

  local ui = vim.api.nvim_list_uis()[1]
  local width = math.floor(ui.width * width_ratio)
  local height = math.floor(ui.height * height_ratio)

  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  -- Create a new buffer
  local buf = nil
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
  end

  -- Floating window options
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, win_opts)

  return { buf = buf, win = win }
end

-- Example usage:
local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
  -- print(vim.inspect(state.floating));
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal)
-- create_floating_window({width = 50, height = 20}) -- custom size
