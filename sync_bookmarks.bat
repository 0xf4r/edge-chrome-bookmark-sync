@echo off
setlocal

REM Define paths to the bookmark files for Edge and Chrome
set CHROME_BOOKMARKS="C:\Users\fahmed\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
set EDGE_BOOKMARKS="C:\Users\fahmed\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"

REM Get the last modified times of the bookmark files
for %%f in (%CHROME_BOOKMARKS%) do set CHROME_MODIFIED=%%~tf
for %%f in (%EDGE_BOOKMARKS%) do set EDGE_MODIFIED=%%~tf

REM Compare the last modified times and sync accordingly
if "%CHROME_MODIFIED%" GTR "%EDGE_MODIFIED%" (
    copy /Y %CHROME_BOOKMARKS% %EDGE_BOOKMARKS%
    echo Chrome bookmarks were newer and copied to Edge.
) else (
    copy /Y %EDGE_BOOKMARKS% %CHROME_BOOKMARKS%
    echo Edge bookmarks were newer and copied to Chrome.
)

endlocal