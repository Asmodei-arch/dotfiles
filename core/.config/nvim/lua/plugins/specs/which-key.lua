return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = function()
    return require("config.whichkey")
  end,
}
