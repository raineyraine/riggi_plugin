--!strict

local fs = require "@lune/fs"
local process = require "@lune/process"
local roblox = require "@lune/roblox"

local PLUGIN_PATH = "plugin"
local DIST = PLUGIN_PATH .. "/dist"

local build_plugin = {}

function build(): string
	if fs.isDir(DIST) then
		fs.removeDir(DIST)
	end

	process.exec("pesde", { "install" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("rojo", { "sourcemap", "sourcemap.project.json", "-o", "sourcemap.json" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("darklua", { "process", "src", "dist" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	process.exec("rojo", { "build", "build.project.json", "-o", "plugin.rbxm" }, {
		shell = true,
		stdio = "inherit",
		cwd = PLUGIN_PATH,
	})

	return PLUGIN_PATH .. "/plugin.rbxm"
end
build_plugin.build = build

function install()
	local built_path = build()
	local copy_to_path = roblox.studioPluginPath()

	fs.copy(built_path, copy_to_path .. "/riggi_plugin_dev.rbxm", true)
end
build_plugin.install = install

return build_plugin
