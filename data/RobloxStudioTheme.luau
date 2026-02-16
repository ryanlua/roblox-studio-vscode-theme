--!strict

--[[
	Extracts colors from the current Roblox Studio theme to print as a JSON.
	Used for inspecting the colors available in the current theme.
	Run this in Roblox Studio from the command bar, then save the JSON in the output.
]]

local HttpService = game:GetService("HttpService")

local modifiers = Enum.StudioStyleGuideModifier:GetEnumItems()
local colors = Enum.StudioStyleGuideColor:GetEnumItems()

local studioTheme = {}

-- Get hex colors from current Roblox Studio theme
for _, color in ipairs(colors) do
	local theme = settings().Studio.Theme :: StudioTheme

	studioTheme[color.Name] = {}

	for _, modifier in ipairs(modifiers) do
		studioTheme[color.Name][modifier.Name] = "#" .. theme:GetColor(color, modifier):ToHex()
	end
end

local json = HttpService:JSONEncode(studioTheme)
print(json)
