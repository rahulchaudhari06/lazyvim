-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local zen = require("zen-mode")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "Toggle Zen mode" })
map({ "n", "v", "i" }, "<M-Up>", "<cmd>:m -2<cr>", { desc = "Move line up" })
map({ "n", "v", "i" }, "<M-Down>", "<cmd>:m +1<cr>", { desc = "Move line down" })

-- Move to start/end of line
map("n", "<D-Left>", "^", { desc = "Move to the beginning of the line" })
map("n", "<D-Right>", "$", { desc = "Move to the end of the line" })

-- Jump between words

map("n", "<A-Left>", "b", { desc = "Jump to the previous word" })
map("n", "<A-Right>", "w", { desc = "Jump to the next word" })

-- Select text to next/previous word
map("v", "<D-Right>", "veiw", { desc = "Select to the next word" })
map("v", "<D-Left>", "b", { desc = "Select to the previous word" })

-- Delete whole words
map("n", "<D-Delete>", "dw", { desc = "Delete the word under the cursor" })
-- Delete whole lines
map("v", "<D-Delete>", "daw", { desc = "Delete the word under the cursor" })

map("n", "<D-Backspace>", "dd", { desc = "Delete the current line" })

map("n", "<leader>j", function()
  local filepath = os.getenv("HOME") .. "/Dropbox/Notes/Journal"
  local date = os.date("%W")
  local filename = filepath .. "/Week-" .. date .. ".md"

  vim.cmd("tabnew " .. filename)
  zen.toggle()
end, { desc = "Open weekly journal", silent = true })
