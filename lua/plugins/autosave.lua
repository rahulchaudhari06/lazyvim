return {
  {
    "nullishamy/autosave.nvim",
    config = function()
      require("autosave").setup({
        debounce = {
          enabled = true,
          delay = 500,
        },
      })
    end,
  },
}
