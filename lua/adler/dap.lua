local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- C Configuration
dap.adapters.lldb = {
	type = "executable",
	command = "/data/data/com.termux/files/usr/bin/lldb", -- Adjust as needed
	name = "lldb",
}
dap.configurations.c = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

-- C++ Configuration
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

-- Rust Configuration
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.cwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

-- JavaScript Configuration
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

-- Common UI setup
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
vim.keymap.set("n", "<space>du", require("dapui").toggle, { desc = "toggle DAP UI" })
vim.keymap.set("n", "<space>db", require("dap").toggle_breakpoint, { desc = "toggle breakpoint" })
vim.keymap.set("n", "<space>dc", require("dap").continue, { desc = "continue" })
vim.keymap.set("n", "<space>di", require("dap").step_into, { desc = "step into" })
vim.keymap.set("n", "<space>do", require("dap").step_over, { desc = "step over" })
vim.keymap.set("n", "<space>dt", require("dap").step_out, { desc = "step out" })
vim.keymap.set("n", "<space>dr", require("dap").repl.open, { desc = "open REPL" })
