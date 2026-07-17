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

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
			args = {
				"--port",
				"${port}",
			},
		},
	}

	dap.configurations.cpp = {
		{
			name = "Launch C++",
			type = "codelldb",
			request = "launch",

			program = function()
				return require("cmake-tools").get_launch_target_path()
			end,

			cwd = "${workspaceFolder}",
		},
	}
end

return M
