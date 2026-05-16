--!strict

local vide = require "@pkgs/vide"
local create = vide.create
local read = vide.read
local source = vide.source
local spring = vide.spring
local changed = vide.changed

local types = require "../../types"
type Can<T> = types.Can<T>

local color = require "../../util/studio_color"
local studio_types = require "../../util/studio_types"

local container = require "./container"
local padding = require "./padding"

export type ButtonProps = {
	primary: Can<boolean>?,
	disabled: Can<boolean>?,
	text: Can<string>,

	activated: ((InputObject, number) -> ())?,

	layout: vide.Properties<TextButton>?,

	_selected: Can<boolean>?,
	_custom_color: Can<studio_types.StudioColors>?,
}

return function(props: ButtonProps)
	local disabled = props.disabled
	local primary = props.primary
	local gui_state = source(Enum.GuiState.Idle)

	local selected = props._selected

	local function modifier(): studio_types.StudioModifiers
		local gui_state = gui_state()

		return if gui_state == Enum.GuiState.NonInteractable
			then "Disabled"
			elseif read(selected) then "Selected"
			elseif gui_state == Enum.GuiState.Press then "Pressed"
			elseif gui_state == Enum.GuiState.Hover then "Hover"
			else "Default"
	end

	return create "TextButton" {
		Size = UDim2.new(1, 0, 0, 24),
		AutomaticSize = Enum.AutomaticSize.Y,
		Interactable = function()
			return not read(disabled)
		end,

		BorderSizePixel = 0,
		Activated = props.activated,

		BackgroundColor3 = spring(
			color(props._custom_color or function(): studio_types.StudioColors
				return if read(primary) then "MainButton" else "Button"
			end, modifier),
			1 / 12,
			1
		),

		changed("GuiState", gui_state :: any),

		create "UICorner" {
			CornerRadius = UDim.new(0, 4),
		},

		padding {
			padding = UDim.new(0, 6),
		},

		container {
			create "TextLabel" {
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),

				BackgroundTransparency = 1,

				Text = props.text,
				TextColor3 = color(function(): studio_types.StudioColors
					return if read(primary) then "BrightText" else "ButtonText"
				end),
				Font = Enum.Font.SourceSans,
				TextSize = 16,
			},
		},

		props.layout,
	}
end
