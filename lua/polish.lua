-- vim.lsp.config("eslint", ...) lands in _configs[name], which has higher
-- precedence than lsp/*.lua rtp files. This runs at startup so it's set
-- before vim.lsp.enable("eslint") is ever called.
vim.lsp.config("eslint", {
  before_init = function(_, config)
    local root_dir = config.root_dir
    if not root_dir then return end

    config.settings = config.settings or {}

    -- Required by vscode-eslint-language-server to scope config file search
    config.settings.workspaceFolder = {
      uri = root_dir,
      name = vim.fn.fnamemodify(root_dir, ':t'),
    }

    -- Yarn2 PnP support
    local pnp_cjs = root_dir .. '/.pnp.cjs'
    local pnp_js = root_dir .. '/.pnp.js'
    if type(config.cmd) == 'table' and (vim.uv.fs_stat(pnp_cjs) or vim.uv.fs_stat(pnp_js)) then
      config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
    end

    -- Use .eslintrc.local.js when present
    if vim.uv.fs_stat(root_dir .. '/.eslintrc.local.js') then
      config.settings.options = config.settings.options or {}
      config.settings.options.overrideConfigFile = root_dir .. '/.eslintrc.local.js'
    end
  end,
})

-- Move lines up and down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
