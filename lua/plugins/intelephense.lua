return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- @type lspconfig.options
      autoformat = false,
      servers = {
        intelephense = {
          filetypes = { "php" },
          -- filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php" },
              -- filetypes = { "php", "blade" },
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
