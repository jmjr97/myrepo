local opts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap

-------------------
-- house keeping --
-------------------

km('n', '-', ':lua MiniFiles.open()<CR>', opts)

-- setup leader
km("", '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove dumb stuff
km('n', '<F1>', [[<ESC>]], opts)
km('i', '<F1>', [[<ESC>]], opts)
km('n', 'Q', 'q', opts)
km('n', 'q', '<Nop>', opts)

-- remap redo
km('n', 'U', ':redo<CR>', opts)
km('n', '<C-r>', '<Nop>', opts)

-- noice
km('n', '<leader>d', ':Noice dismiss<CR>', opts)

-- maximizer
km('n', '<leader>m', ':MaximizerToggle<CR>', opts)

------------------
---- movement ----
------------------

-- insert move movement
km('i', '<C-k>', [[<Up>]], opts)
km('i', '<C-j>', [[<Down>]], opts)
km('i', '<C-h>', [[<Left>]], opts)
km('i', '<C-l>', [[<Right>]], opts)

-- window navigation
km('n', '<C-h>', '<C-w>h', opts)
km('n', '<C-j>', '<C-w>j', opts)
km('n', '<C-k>', '<C-w>k', opts)
km('n', '<C-l>', '<C-w>l', opts)

-- terminal navigation
km("t", '<C-n>', [[<C-\><C-n>]], opts)
km("t", '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
km("t", '<C-k>', [[<Cmd>wincmd k<CR>]], opts)

-- buffers
km('n', '<S-l>', ':bnext<CR>', opts)
km('n', '<S-h>', ':bprevious<CR>', opts)
km('n', '<leader>bb', ':bdelete<CR>', opts)
km('n', '<leader>bd', ':bdelete!<CR>', opts)

-- centered 1/2 page
km('n', '<C-d>', '<C-d>zz', opts)
km('n', '<C-u>', '<C-u>zz', opts)

-- centered search
km('n', 'n', 'nzzzv', opts)
km('n', 'N', 'Nzzzv', opts)

---------------------------
---- text manipulation ----
---------------------------

-- visual move
km('v', 'J', ":m '>+1<CR>gv=gv", opts)
km('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- paste no copy
km('x', '<C-p>', '\"_dP', opts)

-- indent mode
km('v', '<', '<gv', opts)
km('v', '>', '>gv', opts)

-- yank to clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]], opts)
vim.keymap.set({'n', 'v'}, '<leader>p', [["+p]], opts)

-------------------------
---- file management ----
-------------------------

-- oil
vim.keymap.set('n', '-', function()
  local oil = require('oil')
  local util = require('oil.util')
  oil.open_float()
  util.run_after_load(0, function()
    oil.open_preview()
	end)
end, opts)
-- km('n', "-", "<CMD>Oil --float <CR>", opts)

-------------------
---- telescope ----
-------------------

km('n', '<leader>ff', '<cmd>Telescope find_files{ path_display = "absolute" } theme=ivy<cr>', opts)
km('n', '<leader>fa', '<cmd>Telescope find_files cwd=~/ theme=ivy prompt_title=All-Files<cr>', opts)
km('n', '<leader>fb', '<cmd>Telescope buffers theme=dropdown preview=false<cr><escape>', opts)
km('n', '<leader>fc', '<cmd>Telescope find_files cwd=~/.config/nvim/ theme=ivy prompt_title=All-Files<cr>', opts)
km('n', '<leader>fg', '<cmd>Telescope live_grep theme=ivy<cr>', opts)
km('n', '<leader>fh', '<cmd>Telescope help_tags theme=ivy<cr>', opts)
km('n', '<leader>fm', '<cmd>Telescope marks theme=dropdown<cr><escape>', opts)
km('n', '<leader>fr', '<cmd>Telescope oldfiles theme=ivy<cr>', opts)
km('n', '<leader>fs', '<cmd>Telescope git_status theme=ivy<cr>', opts)

------------------
---- obsidian ----
------------------

km('n', '<leader>oo', '<cmd>Telescope find_files cwd=~/Documents/obsidian-sync/ theme=ivy prompt_title=Notes<cr>', opts)
km('n', '<leader>og', ':ObsidianSearch<cr>', opts)
km('n', '<leader>ot', ':ObsidianTOC<cr>', opts)


--------------
---- code ----
--------------

km('n', '<leader>rp', '<cmd>TermExec cmd="python %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Python
km('n', '<leader>rl', '<cmd>TermExec cmd="lua %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Lua
km('n', '<leader>rr', '<cmd>TermExec dir=%:p:h cmd="cargo run"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Rust
km('n', '<leader>rgr', '<cmd>TermExec dir=%:p cmd="go run %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Go
km('n', '<leader>rgb', '<cmd>TermExec dir=%:p cmd="go build %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Go build
km('n', '<leader>rgd', '<cmd>TermExec dir=%:p cmd="go run -tags debug %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Go fyne debug
km('n', '<leader>rgm', '<cmd>TermExec dir=%:p cmd="go run -tags mobile %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Go fyne mobile
km('n', '<leader>rs', '<cmd>TermExec dir=%:p:h cmd="sh %"<CR>:wincmd j<CR>:sleep 1<CR>:start<CR>', opts) -- Bash
