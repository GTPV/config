local built_in = require("telescope.builtin")
-- vim.keymap.set('n', "<leader>pf", builtin.find_files, {});
vim.keymap.set('n', "<leader>ff", built_in.find_files, {});
vim.keymap.set('n', "<leader>fs", function() 
	built_in.grep_string({ search = vim.fn.input("Grep > ") });
end);
