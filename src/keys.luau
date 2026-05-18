--!strict

local function key(extension: string): string
	return "raineyraine/riggi_plugin." .. extension
end

local keys = {
	plugin = {
		main_button = key "button.main",
		main_widget = key "widget.main",
	},
}

return keys
