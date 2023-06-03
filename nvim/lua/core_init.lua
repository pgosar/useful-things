for _, source in ipairs {
    "core.utils.utils", "core.autocommands", "core.main-options",
    "core.plugins", "core.keybindings"

} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end

require("neodev").setup()
require('Comment').setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('bufferline').setup {}
require('scope').setup {}

vim.cmd([[ colorscheme onedark ]])
vim.cmd([[autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif]])

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
