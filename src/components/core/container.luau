--!strict

local vide = require "@pkgs/vide"
local create = vide.create

export type ContainerProps = vide.Properties<Frame>

return function(props: ContainerProps)
	return create "Frame" {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,

		props,
	}
end
