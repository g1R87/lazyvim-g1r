return {
  "ccaglak/phptools.nvim",
  keys = {
    { "<leader>lm", "<cmd>PhpTools Method<cr>" },
    { "<leader>lc", "<cmd>PhpTools Class<cr>" },
    { "<leader>ls", "<cmd>PhpTools Scripts<cr>" },
    { "<leader>lg", "<cmd>PhpTools GetSet<cr>" },
    { "<leader>lf", "<cmd>PhpTools Create<cr>" },
    { "<leader>ld", "<cmd>PhpTools DrupalAutoLoader<cr>" },
    { mode = "v", "<leader>lr", "<cmd>PhpTools Refactor<cr>" },
  },
  dependencies = {
    -- "ccaglak/namespace.nvim", -- optional - php namespace resolver
    -- "ccaglak/larago.nvim", -- optional -- laravel goto blade/components
    "ccaglak/snippets.nvim", -- optional -- native snippet expander
  },
  opts = {
    ui = {
      enable = true, -- default:true; false only if you have a UI enhancement plugin
      fzf = false, -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
    },
    drupal_autoloader = { -- delete if you dont use it
      enable = false, -- default:false
      scan_paths = { "/web/modules/contrib/" }, -- Paths to scan for modules
      root_markers = { ".git" }, -- Project root markers
      autoload_file = "/vendor/composer/autoload_psr4.php", -- Autoload file path
    },
    custom_toggles = { -- delete if you dont use it
      enable = false, -- default:false
      -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
    },
  },
}
