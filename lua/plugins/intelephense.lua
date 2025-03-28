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
          -- filetypes = { "php", "blade", "php_only" },
          settings = {
            intelephense = {
              filetypes = { "php", "php_only" },
              -- filetypes = { "php", "blade", "php_only" },
              files = {
                associations = { "*.php" }, -- Associating .blade.php files as well
                -- associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
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
      },
    },
  },
}
