--!strict

--[[
	Extracts colors from the current Roblox Studio theme and converts to a VS Code theme.
	Used for generating the colors in the VS Code theme from the current Roblox Studio theme.
	Run this in Roblox Studio from the command bar, then save the JSON in the output.
]]

local HttpService = game:GetService("HttpService")

local theme = settings().Studio.Theme :: StudioTheme

-- Get hex color from Roblox Studio theme
local function getStudioColor(name: Enum.StudioStyleGuideColor, modifier: Enum.StudioStyleGuideModifier?): string?
	return "#" .. theme:GetColor(name, modifier):ToHex()
end

local vscodeTheme = {
	colors = {
		-- Script Editor Colors
		["editor.background"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptBackground),
		["editor.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptText),
		["editor.selectionBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelectionBackground),
		["editor.findMatchBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelectionBackground),
		["editor.findMatchHighlightBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.ScriptFindSelectionBackground
		),
		["editor.findMatchHighlightForeground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["editorError.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptError),
		["editorWarning.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptWarning),
		["editorInfo.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptInformation),
		["editorHint.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptHint),
		["editor.lineHighlightBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptEditorCurrentLine),
		["editorWhitespace.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptWhitespace),
		-- Workspace Colors
		["titleBar.activeBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Titlebar,
			Enum.StudioStyleGuideModifier.Selected
		),
		["titleBar.inactiveBackground"] = getStudioColor(Enum.StudioStyleGuideColor.Titlebar),
		["editorGroupHeader.tabsBackground"] = getStudioColor(Enum.StudioStyleGuideColor.TabBar),
		["menubar.selectionForeground"] = getStudioColor(
			Enum.StudioStyleGuideColor.TitlebarText,
			Enum.StudioStyleGuideModifier.Selected
		),
		["menu.background"] = getStudioColor(Enum.StudioStyleGuideColor.TableItem),
		["menu.selectionBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.TableItem,
			Enum.StudioStyleGuideModifier.Selected
		),
		["list.inactiveSelectionForeground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Item,
			Enum.StudioStyleGuideModifier.Hover
		),
		["list.activeSelectionBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Item,
			Enum.StudioStyleGuideModifier.Selected
		),
		["list.focusBackground"] = getStudioColor(Enum.StudioStyleGuideColor.Item, Enum.StudioStyleGuideModifier.Hover),
		["menu.separatorBackground"] = getStudioColor(Enum.StudioStyleGuideColor.Separator),
		["statusBar.background"] = getStudioColor(Enum.StudioStyleGuideColor.StatusBar),
		["sideBar.background"] = getStudioColor(Enum.StudioStyleGuideColor.Item),
		["editorGutter.addedBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffLineNumAdditionBackground),
		["sideBarSectionHeader.background"] = getStudioColor(Enum.StudioStyleGuideColor.CategoryItem),
		["editorGutter.deletedBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffLineNumDeletionBackground),
		["diffEditor.insertedTextBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffTextAdditionBackground),
		["diffEditor.removedTextBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffTextDeletionBackground),
	},
	tokenColors = {
		{
			name = "Text Color",
			scope = { "variable", "support.variable" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptText),
			},
		},
		{
			name = "Operator Color",
			scope = { "keyword.operator", "source" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptOperator),
			},
		},
		{
			name = "Number Color",
			scope = { "constant.numeric" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptNumber),
			},
		},
		{
			name = "String Color",
			scope = { "string" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptString),
			},
		},
		{
			name = "Comment Color",
			scope = { "comment" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptComment),
			},
		},
		{
			name = "Keyword Color",
			scope = { "keyword.operator.wordlike", "storage.modifier.visibility", "keyword.control" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptKeyword),
			},
		},
		{
			name = "Built-in Function Color",
			scope = { "constant.language", "support.constant", "variable.language", "support.function" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
			},
		},
		{
			name = "Local Property Color",
			scope = { "variable.other.property", "variable.language.metamethod" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptProperty),
			},
		},
		{
			name = "'nil' Color",
			scope = { "constant.language.nil" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptNil),
			},
		},
		{
			name = "Bool Color",
			scope = { "constant.language.boolean" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptBool),
			},
		},
		{
			name = "'function' Color",
			scope = { "meta.function" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptFunction),
			},
		},
		{
			name = "'local' Color",
			scope = { "storage.modifier.local" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptLocal),
			},
		},
		{
			name = "'self' Color",
			scope = { "variable.language.self" },
			settings = {
				fontStyle = "bold",
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelf),
			},
		},
		{
			name = "Function Name Color",
			scope = { "entity.name.function" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptFunctionName),
			},
		},
		{
			name = "Script Bracket Color",
			scope = { "punctuation" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptBracket),
			},
		},
		{
			name = "Type Color",
			scope = { "storage.type", "support.type", "entity.name.type" },
			settings = {
				foreground = getStudioColor(Enum.StudioStyleGuideColor.ScriptProperty),
			},
		},
	},
}

local json = HttpService:JSONEncode(vscodeTheme)
print(json)
