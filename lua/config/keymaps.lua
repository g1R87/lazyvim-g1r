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
vim.keymap.del("n", "<leader>l")

local ide_helper = require("phptools.ide_helper") -- delete if you dont use it
-- Laravel IDE Helper keymaps
vim.keymap.set("n", "<leader>lha", ide_helper.generate_all, { desc = "Generate all IDE helpers" })
vim.keymap.set("n", "<leader>lhm", ide_helper.generate_models, { desc = "Generate model helpers" })
vim.keymap.set("n", "<leader>lhf", ide_helper.generate_facades, { desc = "Generate facade helpers" })
vim.keymap.set("n", "<leader>lht", ide_helper.generate_meta, { desc = "Generate meta helper" })
vim.keymap.set("n", "<leader>lhi", ide_helper.install, { desc = "Install IDE Helper package" })

local tests = require("phptools.tests") -- delete if you have a test plugin
vim.keymap.set("n", "<Leader>ta", tests.test.all, { desc = "Run all tests" })
vim.keymap.set("n", "<Leader>tf", tests.test.file, { desc = "Run current file tests" })
vim.keymap.set("n", "<Leader>tl", tests.test.line, { desc = "Run test at cursor" })
vim.keymap.set("n", "<Leader>ts", tests.test.filter, { desc = "Search and run test" })
vim.keymap.set("n", "<Leader>tp", tests.test.parallel, { desc = "Run tests in parallel" })
vim.keymap.set("n", "<Leader>tr", tests.test.rerun, { desc = "Rerun last test" })
vim.keymap.set("n", "<Leader>ti", tests.test.selected, { desc = "Run selected test file" })
