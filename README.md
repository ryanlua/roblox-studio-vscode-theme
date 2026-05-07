# Roblox Studio Themes for VS Code

[![Visual Studio Marketplace Version](https://vsmarketplacebadges.dev/version/ryanluu.roblox-studio-vscode-theme.svg)](https://marketplace.visualstudio.com/items?itemName=ryanluu.roblox-studio-vscode-theme)
[![Visual Studio Marketplace Rating](https://vsmarketplacebadges.dev/rating-star/ryanluu.roblox-studio-vscode-theme.svg)](https://marketplace.visualstudio.com/items?itemName=ryanluu.roblox-studio-vscode-theme&ssr=false#review-details)
[![Preview in vscode.dev](https://img.shields.io/badge/preview%20in-vscode.dev-blue)](https://vscode.dev/editor/theme/ryanluu.roblox-studio-vscode-theme)
[![Discord](https://img.shields.io/discord/385151591524597761?label=roblox%20oss%20discord&color=00be9c)](https://discord.gg/Qm3JNyEc32)

VS Code theme based on Roblox Studio's next-generation UI, with themes for both light and dark modes, including extra script editor themes.

<picture>
	<source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/dark-default.png">
	<source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/light-default.png">
	<img alt="Roblox Studio theme" src="https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/dark-default.png">
</picture>

<details>

<summary>All themes</summary>

Roblox Studio Dark Default
![Roblox Studio Dark Default theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/dark-default.png)

Roblox Studio Dark Extra 1
![Roblox Studio Dark Extra 1 theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/dark-extra-1.png)

Roblox Studio Dark Extra 2
![Roblox Studio Dark Extra 2 theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/dark-extra-2.png)

Roblox Studio Light Default
![Roblox Studio Light Default theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/light-default.png)

Roblox Studio Light Extra 1
![Roblox Studio Light Extra 1 theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/light-extra-1.png)

Roblox Studio Light Extra 2
![Roblox Studio Light Extra 2 theme](https://raw.githubusercontent.com/ryanlua/roblox-studio-vscode-theme/refs/heads/main/images/light-extra-2.png)

</details>

## Theme Generator

If you have custom script editor colors, you can use the [VS Code theme generator](src/vscode-theme.luau) to create your own custom theme.

## VS Code Settings

### Bracket Colors

Bracket pair colorization is enabled by default in VS Code, but Roblox Studio does not use bracket colors, so you may want to disable that in your VS Code settings:

```json
{
	"editor.bracketPairColorization.enabled": false
}
```

### Font

Roblox Studio uses the [Fira Mono](https://github.com/mozilla/Fira) font for its script editor, so you may want to set that as your editor font in VS Code:

1. Install the Fira Mono regular and bold fonts on your system:
	* [Google Fonts](https://fonts.google.com/specimen/Fira+Mono)
	* [GitHub](https://github.com/mozilla/Fira/tree/master/ttf)

2. Add the following to your VS Code settings:
```json
{
	"editor.fontFamily": "'Fira Mono', 'Courier New', monospace"
}
```

## License

Copyright © 2026 Ryan Luu

Licensed under the [MIT](LICENSE.md) license.
