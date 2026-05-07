@echo off
setlocal enabledelayedexpansion

echo Building Rojo projects...

set "OUTPUT_NAME=ThemeTests"
set "ROJO_PROJECT=default.project.json"

REM Cleanup previous build artifacts in root
echo Cleaning up previous build artifacts...
if exist "%OUTPUT_NAME%.rbxm" del /q "%OUTPUT_NAME%.rbxm"
if exist "%OUTPUT_NAME%.rbxmx" del /q "%OUTPUT_NAME%.rbxmx"

REM Build .rbxm file
rojo build --output "%OUTPUT_NAME%.rbxm" %ROJO_PROJECT%

REM Build .rbxmx file
rojo build --output "%OUTPUT_NAME%.rbxmx" %ROJO_PROJECT%

echo Build completed successfully!