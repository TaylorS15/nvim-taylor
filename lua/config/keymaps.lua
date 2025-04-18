local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete character without copying to register" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select entire file" })
vim.keymap.set("n", "<Leader>q", ":quit<Return>", vim.tbl_extend("force", opts, { desc = "Quit current window" }))
vim.keymap.set("n", "<Leader>Q", ":qa<Return>", vim.tbl_extend("force", opts, { desc = "Quit all windows" }))
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center view" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center view" })
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP server" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying to register" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<leader>w", function()
	-- First format the file
	require("conform").format({
		lsp_fallback = true,
		async = false,
	})

	-- Run TailwindSort for relevant filetypes
	local filetype = vim.bo.filetype
	if
		filetype == "javascript"
		or filetype == "typescript"
		or filetype == "javascriptreact"
		or filetype == "typescriptreact"
	then
		-- Check if tailwindcss LSP is attached to the current buffer
		local has_tailwind = false
		for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
			if client.name == "tailwindcss" then
				has_tailwind = true
				break
			end
		end

		-- Only run TailwindSort if tailwindcss LSP is active
		if has_tailwind then
			vim.cmd("TailwindSort")
		end
	end

	-- Save the file
	vim.cmd("update")
end, vim.tbl_extend("force", opts, { desc = "Format and save file" }))
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item and center view" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item and center view" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item and center view" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item and center view" })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep", { desc = "Project search" })
