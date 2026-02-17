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
