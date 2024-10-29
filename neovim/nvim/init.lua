if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("gtpv")
	vim.cmd [[
		au BufRead,BufNewfile *.k-,*.k-- set ft=k-
	]]
end
