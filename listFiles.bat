:: listFiles.bat
:: A short batch file to print
:: a text file listing all files
:: in the current directory
::
:: Adam T. Croft -- 2017
:: adamtcroft.com

:: Turn off command echo
@ECHO OFF

dir /b /a-d > !fileList_temp.txt

more +1 !fileList_temp.txt > !fileList.txt

del !fileList_temp.txt

@ECHO.
@ECHO Directory listing has been created!

!fileList.txt