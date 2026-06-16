---@type LazySpec
return {
  {
    "0xJohnnyboy/scretch.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("scretch").setup {}
    end,
    keys = {
      { "<leader>sn", function() require("scretch").new() end, desc = "New scretch" },
      { "<leader>snn", function() require("scretch").new_named() end, desc = "New named scretch" },
      { "<leader>sft", function() require("scretch").new_from_template() end, desc = "New scretch from template" },
      { "<leader>sl", function() require("scretch").last() end, desc = "Last scretch" },
      { "<leader>ss", function() require("scretch").search() end, desc = "Search scretches" },
      { "<leader>st", function() require("scretch").edit_template() end, desc = "Edit scretch template" },
      { "<leader>sg", function() require("scretch").grep() end, desc = "Grep scretches" },
      { "<leader>sv", function() require("scretch").explore() end, desc = "Explore scretches" },
      { "<leader>sat", function() require("scretch").save_as_template() end, desc = "Save as scretch template" },
    },
  },
}
