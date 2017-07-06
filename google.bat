:: google.bat
:: A short batch file to simplify
:: searching Google from cmd
::
:: Adam T. Croft -- 2017
:: adamtcroft.com

:: Turn off command echo
@ECHO OFF

:: If HELP go to help section
if [%1] == [/?] goto :help

:: Check browser flags
if %1 == -f goto :firefox
if %1 == -c goto :chrome
goto :default

:firefox
firefox https://www.google.com/search?q="%~2"
goto :end

:chrome
chrome https://www.google.com/search?q="%~2"
goto :end

:default
start https://www.google.com/search?q="%~1"

:help
ECHO Searches Google with the desired browser and search term
ECHO 
ECHO Syntax: google.bat [browser] "[search term]"
ECHO Syntax (if PATH set): google [browser] "[search term]"
ECHO.
ECHO browser: -f for Firefox, -c for Chrome, blank for default
ECHO search term must be enclosed in quotation marks
ECHO.

:end