-- add more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  -- dependencies = {
  --   {
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --     opts = {
  --       custom_calculation = function(_, language_tree)
  --         if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" and language_tree._lang ~= "php" then
  --           return "{{-- %s --}}"
  --         end
  --       end,
  --     },
  --   },
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  -- },
  opts = {
    ensure_installed = { "vue" },
    ignore_install = { "wing", "javascript", "php" },
    auto_install = false,
    highlight = {
      enable = true,
    },
    -- Needed because treesitter highlight turns off autoindent for php files
    indent = {
      enable = function()
        return vim.bo.filetype ~= "vue"
      end,
    },
  },
  config = function(_, opts)
    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {
          "src/parser.c",
          -- 'src/scanner.cc',
        },
        branch = "main",
        generate_requires_npm = true,
        -- requires_generate_from_grammar = true,
      },
      filetype = "blade",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
}
