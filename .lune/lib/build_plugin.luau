--!strict

local fs = require "@lune/fs"
local process = require "@lune/process"
local roblox = require "@lune/roblox"
local stdio = require "@lune/stdio"

local DIST = "dist"

local build_plugin = {}

function build(): string
	if fs.isDir(DIST) then
		fs.removeDir(DIST)
	end

	stdio.write(stdio.color("green") .. "installing dependencies" .. stdio.color("reset") .. "\n")
	process.exec("pesde", { "install" }, {
		shell = true,
		stdio = "inherit",
	})

	stdio.write(stdio.color("green") .. "generating sourcemap" .. stdio.color("reset") .. "\n")
	process.exec("rojo", { "sourcemap", "sourcemap.project.json", "-o", "sourcemap.json" }, {
		shell = true,
		stdio = "inherit",
	})

	stdio.write(stdio.color("green") .. "running darklua" .. stdio.color("reset") .. "\n")
	process.exec("darklua", { "process", "src", "dist" }, {
		shell = true,
		stdio = "inherit",
	})

	stdio.write(stdio.color("green") .. "building" .. stdio.color("reset") .. "\n")
	process.exec("rojo", { "build", "build.project.json", "-o", "plugin.rbxm" }, {
		shell = true,
		stdio = "inherit",
	})

	return "plugin.rbxm"
end
build_plugin.build = build

function install()
	local built_path = build()
	local copy_to_path = roblox.studioPluginPath()

	fs.copy(built_path, copy_to_path .. "/riggi_plugin_dev.rbxm", true)
end
build_plugin.install = install

return build_plugin
