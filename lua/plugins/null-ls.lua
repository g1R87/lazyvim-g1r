return {
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- nls.builtins.diagnostics.phpstan.with({
          --   extra_args = {
          --     "--memory-limit=2G",
          --   },
          --   method = nls.methods.DIAGNOSTICS_ON_SAVE,
          -- }),
        },
      }
    end,
  },
  {
    -- add longer timeout, since formatting blade files gets a little slow
    -- "neovim/nvim-lspconfig",
    -- opts = {
    --   format = { timeout_ms = 2000 },
    -- },
  },
}
