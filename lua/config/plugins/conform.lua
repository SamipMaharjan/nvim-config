return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        -- async = true,
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        python = { "ruff_format" },
        sh = { "shfmt" },
      },
    },
  }
}
