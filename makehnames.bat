:C.2.4.1 Summary
:makehnames.bat produces a file named ”hnames.dat” that lists all files in the working directory with a *.tpr extension. ”hnames.dat” is used by HAngle and HMatch.
:C.2.4.2 Requirements
:makehnames.bat must be located in the same directory as the files to be listed.
:C.2.4.3 User Input
:None required.
:C.2.4.4 Output
:A file named ”hnames.dat,” containing a list of *.tpr files in the working directory, is produced. The source files are not modified.
:C.2.4.5 Listing

set OLDDIR=%CD%
::Loop through all files with .tpr extension
for %%K in (*.tpr) do call :hnames "%%K"
goto:eof
:hnames
set name=%~n1
echo %name% >> hnames.dat
120goto:eof
:eof
exit
