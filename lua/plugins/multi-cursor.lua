---@type LazySpec
return {
  {
    "mg979/vim-visual-multi",
    keys = { "<C-n>", "<C-M-j>", "<C-M-k>", { "\\\\A", mode = "n" } },
    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<C-M-j>",
        ["Add Cursor Up"] = "<C-M-k>",
      }
    end,
  },
}
