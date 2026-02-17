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
	-- Colors for VS Code UI elements, such as the editor background, activity bar, etc.
	-- https://code.visualstudio.com/api/references/theme-color
	colors = {
		-- Base colors
		["focusBorder"] = getStudioColor(Enum.StudioStyleGuideColor.ButtonBorder),
		["foreground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["widget.shadow"] = getStudioColor(Enum.StudioStyleGuideColor.Shadow),
		["selection.background"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelectionBackground),
		["icon.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),

		-- Text colors
		["textLink.activeForeground"] = getStudioColor(
			Enum.StudioStyleGuideColor.LinkText,
			Enum.StudioStyleGuideModifier.Hover
		),
		["textLink.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.LinkText),

		-- Button control
		["button.background"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButton),
		["button.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButtonText),
		["button.border"] = getStudioColor(Enum.StudioStyleGuideColor.DialogButtonBorder),
		["button.separator"] = getStudioColor(Enum.StudioStyleGuideColor.DialogButtonBorder),
		["button.hoverBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.DialogMainButton,
			Enum.StudioStyleGuideModifier.Hover
		),
		["button.secondaryForeground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogButtonText),
		["button.secondaryBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogButton),
		["button.secondaryHoverBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.DialogButton,
			Enum.StudioStyleGuideModifier.Hover
		),

		-- Input control
		["input.background"] = getStudioColor(Enum.StudioStyleGuideColor.InputFieldBackground),
		["input.border"] = getStudioColor(Enum.StudioStyleGuideColor.InputFieldBorder),

		-- Scrollbar control
		["scrollbar.background"] = getStudioColor(Enum.StudioStyleGuideColor.ScrollBarBackground),
		["scrollbar.shadow"] = getStudioColor(Enum.StudioStyleGuideColor.Shadow),
		["scrollbarSlider.activeBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.ScrollBar,
			Enum.StudioStyleGuideModifier.Pressed
		),
		["scrollbarSlider.background"] = getStudioColor(Enum.StudioStyleGuideColor.ScrollBar),
		["scrollbarSlider.hoverBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.ScrollBar,
			Enum.StudioStyleGuideModifier.Hover
		),

		-- Badge
		["badge.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButtonText),
		["badge.background"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButton),

		-- Lists and trees
		["list.activeSelectionBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Item,
			Enum.StudioStyleGuideModifier.Selected
		),
		["list.activeSelectionForeground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["list.inactiveSelectionBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Item,
			Enum.StudioStyleGuideModifier.Hover
		),
		["list.inactiveSelectionForeground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["list.errorForeground"] = getStudioColor(Enum.StudioStyleGuideColor.ErrorText),
		["list.warningForeground"] = getStudioColor(Enum.StudioStyleGuideColor.WarningText),

		-- Activity Bar
		["activityBar.background"] = getStudioColor(Enum.StudioStyleGuideColor.RibbonButton),
		["activityBar.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["activityBar.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["activityBarBadge.background"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButton),
		["activityBarBadge.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButtonText),
		["activityWarningBadge.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButtonText),
		["activityWarningBadge.background"] = getStudioColor(Enum.StudioStyleGuideColor.WarningText),
		["activityErrorBadge.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.DialogMainButtonText),
		["activityErrorBadge.background"] = getStudioColor(Enum.StudioStyleGuideColor.ErrorText),

		-- Side Bar
		["sideBar.background"] = getStudioColor(Enum.StudioStyleGuideColor.Item),
		["sideBar.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["tab.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["sideBarSectionHeader.background"] = getStudioColor(Enum.StudioStyleGuideColor.CategoryItem),

		-- Editor Groups & Tabs
		["editorGroup.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["editorGroupHeader.tabsBackground"] = getStudioColor(Enum.StudioStyleGuideColor.TabBar),
		["editorGroupHeader.tabsBorder"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["editorGroupHeader.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),
		["tab.inactiveBackground"] = getStudioColor(Enum.StudioStyleGuideColor.TabBar),

		-- Editor colors
		["editor.background"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptBackground),
		["editor.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptText),
		["editorLineNumber.foreground"] = getStudioColor(
			Enum.StudioStyleGuideColor.MainText,
			Enum.StudioStyleGuideModifier.Disabled
		),
		["editorLineNumber.activeForeground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["editor.selectionBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelectionBackground),
		["editor.findMatchBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptSelectionBackground),
		["editor.findMatchHighlightForeground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["editor.findMatchHighlightBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.ScriptFindSelectionBackground
		),
		["editor.lineHighlightBackground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptEditorCurrentLine),
		["editorWhitespace.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptWhitespace),
		["editorError.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptError),
		["editorWarning.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptWarning),
		["editorHint.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptHint),
		["editorInfo.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.ScriptInformation),
		["editorGutter.addedBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffLineNumAdditionBackground),
		["editorGutter.deletedBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffLineNumDeletionBackground),

		-- Diff editor colors
		["diffEditor.insertedTextBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffTextAdditionBackground),
		["diffEditor.removedTextBackground"] = getStudioColor(Enum.StudioStyleGuideColor.DiffTextDeletionBackground),

		-- Status Bar colors
		["statusBar.background"] = getStudioColor(Enum.StudioStyleGuideColor.StatusBar),
		["statusBar.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["statusBar.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),

		-- Title Bar colors
		["titleBar.activeBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.Titlebar,
			Enum.StudioStyleGuideModifier.Selected
		),
		["titleBar.activeForeground"] = getStudioColor(
			Enum.StudioStyleGuideColor.TitlebarText,
			Enum.StudioStyleGuideModifier.Selected
		),
		["titleBar.inactiveBackground"] = getStudioColor(Enum.StudioStyleGuideColor.Titlebar),
		["titleBar.inactiveForeground"] = getStudioColor(Enum.StudioStyleGuideColor.TitlebarText),
		["titleBar.border"] = getStudioColor(Enum.StudioStyleGuideColor.Border),

		-- Menu Bar colors
		["menubar.selectionForeground"] = getStudioColor(
			Enum.StudioStyleGuideColor.TitlebarText,
			Enum.StudioStyleGuideModifier.Selected
		),
		["menu.selectionBackground"] = getStudioColor(
			Enum.StudioStyleGuideColor.TableItem,
			Enum.StudioStyleGuideModifier.Selected
		),
		["menu.foreground"] = getStudioColor(Enum.StudioStyleGuideColor.MainText),
		["menu.background"] = getStudioColor(Enum.StudioStyleGuideColor.TableItem),
		["menu.separatorBackground"] = getStudioColor(Enum.StudioStyleGuideColor.Separator),
	},
	-- Colors for syntax highlighting in the editor
	-- https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide#semantic-theming
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
