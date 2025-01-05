return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = function()
    return {
      winopts = {
        width = 1,
        preview = {
          horizontal = "right:45%",
        },
      },
    }
  end,
}
