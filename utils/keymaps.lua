-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map <C-w> to copilot word competion and <C-p> to copilot completion
vim.keymap.set("i", "<C-w>", "<Plug>(copilot-accept-word)")
vim.keymap.set("i", "<C-e>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
