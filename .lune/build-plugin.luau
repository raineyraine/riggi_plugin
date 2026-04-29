--!strict

local fs = require "@lune/fs"
local process = require "@lune/process"

local PLUGIN_PATH = "plugin"
local DIST = PLUGIN_PATH .. "/dist"

function build()
	if fs.isDir(DIST) then
		fs.removeDir(DIST)
	end

	process.exec("pesde", { "install" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("rojo", { "sourcemap", "-o", "sourcemap.json" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("darklua", { "process", "src", "dist" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("rojo", { "build", "-o", "plugin.rbxm" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})
end

build()
