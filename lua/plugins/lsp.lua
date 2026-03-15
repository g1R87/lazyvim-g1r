return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- @type lspconfig.options
      autoformat = false,
      servers = {
        intelephense = {
          filetypes = { "php", "php_only" },
          -- filetypes = { "php", "blade", "blade.php"},
          settings = {
            intelephense = {
              filetypes = { "php", "php_only", "blade" },
              -- filetypes = { "php", "blade", "blade.php" },
              files = {
                associations = { "*.php" }, -- Associating .blade.php files as well
                -- associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },

        volar = {
          -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        rust_analyzer = { enabled = false },
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  "vim",
                  "require",
                },
              },
            },
          },
        },
        pyright = {
            capabilities = {
              workspace = {
                didChangeWatchedFiles = {
                  dynamicRegistration = true,
                },
              },
            },
        },
      },
    },
  },
}
