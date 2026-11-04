@echo off
setlocal

rem Native Windows entry point. Uses the same .latexmkrc as make.
set "ACTION=%~1"
set "LATEXMK_ARGS="
if "%ACTION%"=="" set "ACTION=pdf"
if /i "%ACTION%"=="help" goto help
if /i "%ACTION%"=="--help" goto help
if /i "%ACTION%"=="pdf" goto run
if /i "%ACTION%"=="watch" (
    set "LATEXMK_ARGS=-pvc -view=none"
    goto run
)
if /i "%ACTION%"=="rebuild" (
    set "LATEXMK_ARGS=-g"
    goto run
)
if /i "%ACTION%"=="clean" (
    set "LATEXMK_ARGS=-c"
    goto run
)
if /i "%ACTION%"=="distclean" (
    set "LATEXMK_ARGS=-C"
    goto run
)
echo ERROR: Unknown command "%ACTION%".
call :usage
exit /b 2

:run
where latexmk >nul 2>&1
if errorlevel 1 (
    echo ERROR: latexmk was not found on PATH.
    echo Install MiKTeX or TeX Live, then reopen your terminal.
    echo See the Windows instructions in README.md.
    exit /b 1
)
where pdflatex >nul 2>&1
if errorlevel 1 (
    echo ERROR: pdfLaTeX was not found on PATH.
    echo Install MiKTeX or TeX Live, then reopen your terminal.
    exit /b 1
)
call latexmk -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: latexmk could not start.
    echo For MiKTeX, install Strawberry Perl and the latexmk package.
    echo Reopen your terminal after installation.
    exit /b 1
)

rem Resolve main.tex relative to this script, even from another directory.
pushd "%~dp0"
if errorlevel 1 exit /b 1
call latexmk %LATEXMK_ARGS% main.tex
set "BUILD_EXIT=%ERRORLEVEL%"
popd
if not "%BUILD_EXIT%"=="0" echo ERROR: latexmk failed. See build\main.log for details.
endlocal & exit /b %BUILD_EXIT%

:help
call :usage
exit /b 0

:usage
echo Usage: build.cmd [pdf^|watch^|rebuild^|clean^|distclean^|help]
echo   pdf        Build build\main.pdf. This is the default.
echo   watch      Rebuild on changes. Press Ctrl+C to stop.
echo   rebuild    Force recompilation, ignoring cached change detection.
echo   clean      Remove intermediate files and keep the PDF.
echo   distclean  Remove intermediate files and the PDF.
exit /b 0
