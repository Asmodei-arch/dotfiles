local M = {}

function M.setup()
	require("cmake-tools").setup({
		cmake_build_directory = "build",
		cmake_build_type = "Debug",

		cmake_generate_options = {
			"-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
		},

		cmake_build_options = {
			"-j4",
		},
	})
end

return M
