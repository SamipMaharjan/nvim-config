return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            }
          }
        },

        -- Important: ensure proper root directory detection
        root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),


      }
      -- lspconfig.rust_analyzer.setup {
      --   capabilities = capabilities,
      --   cmd = {
      --     'rustup', "run", "stable", "rust-analyzer"
      --   }
      --   -- on_attach = on_attach
      --   -- settings = {
      --   --   ["rust-analyzer"] = {
      --   --     cargo = { allFeatures = true },
      --   --     checkOnSave = { command = "clippy" },
      --   --   }
      --   -- }
      -- }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git"),
        settings = {
          ["rust-analyzer"] = {
            diagnostics = { enable = true },
            checkOnSave = { command = "clippy" },
          },
        },
      }

      lspconfig.tailwindcss.setup {
        capabilities = capabilities,

        root_dir = lspconfig.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "package.json",
          ".git"
        ),

        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "svelte",
          "vue",
          "astro",
        },

        settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning",
            },
            validate = true,
          },
        },
      }
      -- GOTO Definitions
      vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

      -- vim.api.nvim_create_autocmd('lspattach', {
      --   callback = function(args)
      --     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      --     if not client then return end
      --
      --
      --     -- Auto-format ("lint") on save.
      --     -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      --     if client:supports_method('textDocument/formatting', 0) then
      --       vim.api.nvim_create_autocmd('BufWritePre', {
      --         --group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
      --         buffer = args.buf,
      --         callback = function()
      --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
      --         end,
      --       })
      --     end
      --   end,
      -- })

      --:  vim.list_contains
    end
  }
}
