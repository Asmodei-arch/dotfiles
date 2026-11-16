return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			local lint = require("lint")

			lint.linters.verible = {
				cmd = "verible-verilog-lint",
				stdin = false,
				append_fname = true,
				stream = "stdout",
				ignore_exitcode = true,

				parser = require("lint.parser").from_pattern(
					"([^:]+):(%d+):(%d+)%-(%d+): (.+)",
					{ "file", "lnum", "col", "end_col", "message" },
					nil,
					{
						source = "verible",
						severity = vim.diagnostic.severity.WARN,
					},
					{
						lnum_offset = -1,
						end_col_offset = -1,
					}
				),
			}

			lint.linters_by_ft = {
				systemverilog = { "verible" },
				verilog = { "verible" },
			}

			vim.api.nvim_create_user_command("SVLint", function()
				lint.try_lint("verible")
			end, {
				desc = "Run Verible SystemVerilog linter",
			})

			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function(args)
					if vim.bo[args.buf].filetype == "systemverilog" then
						lint.try_lint("verible")
					end
				end,
			})

			vim.api.nvim_create_user_command("SVSim", function()
				local current_file = vim.api.nvim_buf_get_name(0)
				local start_dir = current_file ~= "" and vim.fs.dirname(current_file) or vim.fn.getcwd()

				local makefiles = vim.fs.find("Makefile", {
					path = start_dir,
					upward = true,
				})

				if #makefiles == 0 then
					vim.notify("Makefile not found", vim.log.levels.ERROR)
					return
				end

				local root = vim.fs.dirname(makefiles[1])

				vim.system({ "make", "sim" }, {
					cwd = root,
					text = true,
				}, function(result)
					vim.schedule(function()
						local output = table.concat(
							vim.tbl_filter(function(s)
								return s and s ~= ""
							end, { result.stdout, result.stderr }),
							"\n"
						)

						if result.code ~= 0 then
							vim.notify(
								output ~= "" and output or "Simulation failed",
								vim.log.levels.ERROR,
								{ title = "SystemVerilog" }
							)
							return
						end

						vim.notify(
							output ~= "" and output or "Simulation completed",
							vim.log.levels.INFO,
							{ title = "SystemVerilog" }
						)

						local vcd = vim.fs.joinpath(root, "wave.vcd")

						if vim.fn.filereadable(vcd) == 0 then
							vim.notify("wave.vcd not found", vim.log.levels.ERROR)
							return
						end

						vim.system({ "gtkwave", vcd }, {
							cwd = root,
							detach = true,
						})
					end)
				end)
			end, {
				desc = "Compile and simulate SystemVerilog project, then open GTKWave",
			})
		end,
	},
}
