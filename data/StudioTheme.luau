--!strict

local HttpService = game:GetService("HttpService")

local modifiers = Enum.StudioStyleGuideModifier:GetEnumItems()
local colors = Enum.StudioStyleGuideColor:GetEnumItems()

local output = {}

for _, color in ipairs(colors) do
	local studioTheme = settings().Studio.Theme :: StudioTheme

	output[color.Name] = {}

	for _, modifier in ipairs(modifiers) do
		output[color.Name][modifier.Name] = "#" .. studioTheme:GetColor(color, modifier):ToHex()
	end
end

local json = HttpService:JSONEncode(output)
print(json)