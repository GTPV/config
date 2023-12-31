-- if has('persistent_undo') then
	-- let target_path = expand('~/.nvim/undodir')
	-- let &undodir = target_path
	-- set undofile
-- endif

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
