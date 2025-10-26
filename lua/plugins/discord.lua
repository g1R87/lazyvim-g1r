return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {
    -- lsp = {
    --     show_problem_count = true,
    --     severity = 3,
    -- },
  display={
      theme = '',
    },
    -- fk this sht
    text = {
      default = nil,
      workspace = '',
      viewing = '',
      editing = '',
      file_browser = '',
      plugin_manager = '',
      lsp = '',
      docs = '',
      vcs = '',
      notes = '',
      debug = '',
      test = '',
      diagnostics = '',
      games = '',
      terminal = '',
      dashboard = "Home",
    },
  },
}
