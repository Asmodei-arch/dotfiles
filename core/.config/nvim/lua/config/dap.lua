local M = {}

function M.setup()
	local dap = require("dap")
	local dapui = require("dapui")

	dap.listeners.before.launch["build_before_debug"] = function()
		require("cmake-tools").build()
	end
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
	}

	dap.configurations.cpp = {
		{
			name = "Launch C++",
			type = "cppdbg",
			request = "launch",

			program = function()
				return require("cmake-tools").get_launch_target_path()
			end,

			cwd = "${workspaceFolder}",

			MIMode = "gdb",
			miDebuggerPath = "/usr/bin/gdb",

			stopAtEntry = false,

			setupCommands = {
				{
					text = "-enable-pretty-printing",
					description = "Enable pretty printing",
					ignoreFailures = false,
				},
			},
		},
	}
end

return M
