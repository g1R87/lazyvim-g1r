return {

  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  -- { "ellisonleao/gruvbox.nvim" },

  -- {
  --   "rebelot/kanagawa.nvim"
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000 ,
  --   config = true,
  --   opts = {
  --      transparent_mode = true
  --   }
  -- },
  -- -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "gruvbox",
    },
  },

  {
  "akinsho/bufferline.nvim",
  optional = true,
  opts = function(_, opts)
    if (vim.g.colors_name or ""):find("catppuccin") then
      opts.highlights = require("catppuccin.special.bufferline").get_theme()
    end
  end,
}
}
