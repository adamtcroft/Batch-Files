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
SHIFT
set args=%1

:grabargsfox
if "%2" NEQ "" (
	set args=%args%+%2%
	shift
	goto :grabargsfox
)

ECHO Now searching: %args%
firefox https://www.bing.com/search?q=%args%
goto :end

:chrome
SHIFT
set args=%1

:grabargschr
if "%2" NEQ "" (
	set args=%args%+%2%
	shift
	goto :grabargschr
)

ECHO Now searching: %args%
chrome https://www.bing.com/search?q=%args%
goto :end

:default
SET args=%*
ECHO Now searching: %args%
SET args=%args: =+%
start https://www.bing.com/search?q=%args%
goto :end

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
