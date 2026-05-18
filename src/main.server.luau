--!strict

local vide = require "@pkgs/vide"
local root = vide.root

local app = require "./app"

vide.defaults = true

local destroy = root(function()
	app(plugin)
end)

plugin.Unloading:Connect(destroy)
