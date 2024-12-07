-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>gd", function()
  Util.float_term(
    { "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
    { cwd = Util.get_root(), esc_esc = false }
  )
end, { desc = "LazyDocker (root dir)" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- php namespace resolver
vim.keymap.set("n", "<leader>na", "<cmd>Php classes<cr>", { desc = "GetClasses", silent = true })
vim.keymap.set("n", "<leader>nc", "<cmd>Php class<cr>", { desc = "GetClass", silent = true })
vim.keymap.set("n", "<leader>nn", "<cmd>Php namespace<cr>", { desc = "Namespace", silent = true })
vim.keymap.set("n", "<leader>ns", "<cmd>Php sort<cr>", { desc = "Sort Classes", silent = true })
