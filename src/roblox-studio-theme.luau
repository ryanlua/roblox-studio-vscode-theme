--!strict

--[[
	Extracts colors from the current Roblox Studio theme to print as a JSON.
	Used for inspecting the colors available in the current theme.
	Run this in Roblox Studio from the command bar, then save the JSON in the output.
]]

const HttpService = game:GetService("HttpService")

const modifiers = Enum.StudioStyleGuideModifier:GetEnumItems()
const colors = Enum.StudioStyleGuideColor:GetEnumItems()

const studioTheme = {}

-- Get hex colors from current Roblox Studio theme
for _, color in colors do
	const theme = settings().Studio.Theme :: StudioTheme

	studioTheme[color.Name] = {}

	for _, modifier in modifiers do
		studioTheme[color.Name][modifier.Name] = "#" .. theme:GetColor(color, modifier):ToHex()
	end
end

const json = HttpService:JSONEncode(studioTheme)
print(json)
