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
    ensure_installed = { "vue", "cpp", "rust", "ron", "ninja", "rst" },
    ignore_install = { "wing", "javascript", "php" },
    auto_install = false,
    -- Needed because treesitter highlight turns off autoindent for php files
    -- Needed because indent enable doesn't work for vue files
    -- indent = {
    --   enable = function()
    --     return vim.bo.filetype ~= "vue"
    --   end,
    -- },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local filetype = vim.bo[buf].filetype
        return lang == "blade" or filetype == "blade"
      end,
    },
    indent = {
      enable = function()
        return vim.bo.filetype ~= "vue"
      end,
      disable = function(lang, buf)
        local filetype = vim.bo[buf].filetype
        return lang == "blade" or filetype == "blade"
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
