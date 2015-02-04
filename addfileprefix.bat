:C.2.1.1 Summary
:This batch file adds a prefix to all file names with a certain extension (supplied by the user) in the working directory. This program was used to differentiate between multiple files from multiple analyses with the same filename.
:C.2.1.2 Requirements
:addfileprefix.bat must be located in the same directory as the files to be modified.
:C.2.1.3 User Input
:User is prompted for the three-letter extension of the files that will be modified, and for the prefix (which can be multiple characters) to be applied to the filenames.
:C.2.1.4 Output
:Prefix will be added to filenames of the type supplied by the user in the working directory.
:C.2.1.5 Listing

@echo off
set dir=%CD%
set /p type=File type (extension):
set /p prefix=Prefix wanted:
md %prefix%prefix
for /r %%K in (*.%type%) do call :rename "%%K"
goto:eof
:rename
echo Adding prefix to %name%
set name=%~n1
copy %name%.%type% "%dir%\%prefix%prefix\%prefix%%name%.%type%"
goto:eof
