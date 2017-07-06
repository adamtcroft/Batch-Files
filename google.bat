:: google.bat
:: A short batch file to simplify
:: searching Google from cmd
::
:: Adam T. Croft -- 2017
:: adamtcroft.com

:: Turn off command echo
@ECHO OFF

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

:end