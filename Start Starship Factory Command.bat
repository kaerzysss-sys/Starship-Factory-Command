@echo off
setlocal
cd /d "%~dp0"

set "HTML=%~dp0StarshipFactoryCommand.html"

if not exist "%HTML%" (
    echo StarshipFactoryCommand.html was not found in this folder.
    pause
    exit /b 1
)

rem 1. Microsoft Edge
set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%LocalAppData%\Microsoft\Edge\Application\msedge.exe"
if exist "%BROWSER%" goto launch_app

rem 2. Google Chrome
set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if exist "%BROWSER%" goto launch_app

rem 3. Brave
set "BROWSER=%ProgramFiles%\BraveSoftware\Brave-Browser\Application\brave.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%ProgramFiles(x86)%\BraveSoftware\Brave-Browser\Application\brave.exe"
if exist "%BROWSER%" goto launch_app
set "BROWSER=%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe"
if exist "%BROWSER%" goto launch_app

rem 4. Firefox
set "BROWSER=%ProgramFiles%\Mozilla Firefox\firefox.exe"
if exist "%BROWSER%" goto launch_browser
set "BROWSER=%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe"
if exist "%BROWSER%" goto launch_browser

rem 5. Windows default browser
start "" "%HTML%"
exit /b 0

:launch_app
start "" "%BROWSER%" --app="file:///%HTML%"
exit /b 0

:launch_browser
start "" "%BROWSER%" "%HTML%"
exit /b 0
