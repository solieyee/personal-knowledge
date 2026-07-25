@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "html=%cd%\reading-collection\index.html"
if exist "%html%" (
    start "" "%html%"
    echo.
    echo Done! The reading collection has been opened in your browser.
    echo.
) else (
    echo Error: %html% not found.
    pause
)
