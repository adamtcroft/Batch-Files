:: gvimServer.bat
:: A short batch file to simplify
:: sending a file to a remote Vim window
::
:: Adam T. Croft -- 2018
:: adamtcroft.com

:: Turn off command echo
@ECHO OFF

:: IF HELP go to help section
if [%1] == [/?] goto :help

:: If there's no 2nd variable, go to "singleVariable"
if [%2] == [] goto :singleVariable

:: Otherwise run a two variable command
gvim --servername %1 --remote %2
goto :end

:singleVariable
gvim --remote %1
goto :end

:help
ECHO.
ECHO Runs gvim with specific, easier to type server options.
ECHO.
ECHO Syntax: gvimServer [filename] for default server
ECHO Syntax: gvimServer [server] [filename] for specific server.
ECHO.

:end
