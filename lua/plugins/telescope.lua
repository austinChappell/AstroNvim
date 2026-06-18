---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Ensure live_grep always uses literal strings and case-insensitive by default,
    -- even when called by AstroNvim's default keymaps.
    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      live_grep = {
        additional_args = { "--fixed-strings", "--ignore-case" },
      },
    })
    return opts
  end,
  init = function()
    -- Use VeryLazy to set our keymap after all plugins (including AstroNvim) have loaded,
    -- so we win any keymap conflicts.
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        local case_sensitive = false

        local function grep(text)
          require("telescope.builtin").live_grep({
            default_text = text,
            additional_args = case_sensitive
                and { "--fixed-strings", "--case-sensitive" }
              or { "--fixed-strings", "--ignore-case" },
            prompt_title = case_sensitive and "Search [Case Sensitive] <C-s> toggle"
              or "Search [Case Insensitive] <C-s> toggle",
            attach_mappings = function(prompt_bufnr, map)
              local function toggle()
                local query =
                  require("telescope.actions.state").get_current_picker(prompt_bufnr):_get_prompt()
                require("telescope.actions").close(prompt_bufnr)
                case_sensitive = not case_sensitive
                vim.schedule(function() grep(query) end)
              end
              map("i", "<C-s>", toggle)
              map("n", "<C-s>", toggle)
              return true
            end,
          })
        end

        vim.keymap.set("n", "<leader>fw", grep, { desc = "Search project (literal)" })
      end,
    })
  end,
}
