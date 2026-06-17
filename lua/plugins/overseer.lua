---@type LazySpec
return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerOpen", "OverseerClose", "OverseerInfo" },
    keys = {
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oo", "<cmd>OverseerOpen<cr>", desc = "Open Overseer" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build task" },
    },
    opts = {},
  },
}
