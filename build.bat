@echo off

mkdir ..\build
pushd ..\build

if %1 == win32_handmade.cpp goto :handmadehero
goto :default

:handmadehero
cl ..\code\%1 user32.lib Gdi32.lib
goto :end

:default
cl ..\code\%1 %2
goto :end

:end
popd
cl -Zi (insert files)