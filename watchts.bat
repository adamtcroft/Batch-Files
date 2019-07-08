:: search.bat
:: A short batch file to simplify
:: searching Bing from cmd
::
:: Adam T. Croft -- 2017
:: adamtcroft.com

:: Turn off command echo
@ECHO OFF

:: If HELP go to help section
if [%1] == [/?] goto :help

:: Check browser flags
if %1 == -f goto :getbrowser
if %1 == -c goto :getbrowser
goto :default

:getbrowser
set browser=%1

if "%browser%" == "-c" set browser=chrome
if "%browser%" == "-f" set browser=firefox

SHIFT
set args=%1

:grabargs
if "%2" NEQ "" (
	set args=%args%+%2%
	shift
	goto :grabargs
)

ECHO Now searching: %args%
ECHO browser: %browser%
%browser% https://www.bing.com/search?q=%args%
goto :end

:default
SET args=%*
ECHO Now searching: %args%
SET args=%args: =+%
start https://www.bing.com/search?q=%args%
goto :end

:help
ECHO Searches Bing with the desired browser and search term
ECHO. 
ECHO Syntax: search.bat [browser] [search term]
ECHO Syntax (if PATH set): search [browser] [search term]
ECHO.
ECHO browser: -f for Firefox, -c for Chrome, blank for default
ECHO.

:end
