local vide = require "@pkgs/vide"
local create = vide.create

local types = require "../../types"

type Can<T> = types.Can<T>
type padding = {
	padding: Can<UDim>?,
	x: Can<UDim>?,
	y: Can<UDim>?,
	left: Can<UDim>?,
	right: Can<UDim>?,
	top: Can<UDim>?,
	bottom: Can<UDim>?,
}

return function(props: padding)
	local padding = props.padding or UDim.new(0, 8)
	local x = props.x or padding
	local y = props.y or padding
	local left = props.left or x
	local right = props.right or x
	local top = props.top or y
	local bottom = props.bottom or y

	return create "UIPadding" {
		PaddingLeft = left,
		PaddingRight = right,
		PaddingTop = top,
		PaddingBottom = bottom,
	}
end
