@echo off
setlocal

:: -----------------------------------------------

:: CHANGE ME
set "TWDir=F:\Games\SwordofConvallaria\SoCLauncher\SwordOfConvallaria\assets\lua"
set "TWLuaName=lua_dblang_zh-tw.unity3d"
set "Url=https://github.com/Jules-Stash/soc-eng-lua-downloader/raw/refs/heads/main/lua_dblang_en.unity3d"

:: -----------------------------------------------

:: Self restart with flag to prevent console from closing on error handling
if "%~1" neq "stay_open" (
    start cmd /k "%~f0" stay_open
    exit /b
)

echo --- Starting script ---
echo.

cd /d "%TWDir%"

:: Get remote lua size
for /f "tokens=2" %%a in ('curl -sI -L "%Url%" ^| findstr /i "Content-Length"') do set "remote_size=%%a"
set /a remote_size=%remote_size%
echo Remote lua size: %remote_size% bytes

:: Get local lua size
if exist "%TWLuaName%" (
    for %%i in ("%TWLuaName%") do set "local_size=%%~zi"
) else (
    set "local_size=0"
)
echo Local lua size: %local_size% bytes

:: Compare files
if %remote_size% equ %local_size% (
	echo.
    echo --- Skipping download. Files are identical. Script finished ---
) else (
    echo Starting download...

	:: Backup TW lua and remome previous
	if exist "_%TWLuaName%" del /f /q "_%TWLuaName%"
	if exist "%TWLuaName%" ren "%TWLuaName%" "_%TWLuaName%"

	:: Download eng lua
	curl -L -o "%TWDir%\%TWLuaName%" "%Url%"

	:: Check exit code
	echo.
	if errorlevel 1 (
	    echo --- Failed to download ---
	    :: Restore backup
	    ren "_%TWLuaName%" "%TWLuaName%"
	) else (
	    echo --- Success ---
	)
)

pause
