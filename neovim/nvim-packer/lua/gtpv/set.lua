vim.opt.guicursor = ""
vim.opt.background = "light"
vim.opt.termguicolors = true

vim.opt.hlsearch = false -- Highlight all matches on previous search pattern
vim.opt.incsearch = true

vim.opt.nu = true -- Show line numbers

vim.opt.autoindent = true -- Auto indent
vim.opt.ts = 8 -- Tab size
vim.opt.sts = 8 -- Soft tab stop
vim.opt.sw = 8 -- Shift width
vim.opt.cindent = true -- C indenting
vim.opt.smarttab = true -- Smart tabbing
vim.opt.smartindent = true -- Smart indenting

vim.opt.smartcase = true -- Smart case
vim.opt.ruler = true -- Show the cursor position all the time
vim.opt.laststatus = 2
vim.opt.showmatch = true -- Show matching brackets
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.fileencoding = "utf-8" -- The encoding written to file

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 7

vim.opt.updatetime = 50
vim.opt.timeoutlen = 2000
