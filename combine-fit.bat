:C.2.2.1 Summary
:combine-fit.bat appends all files with a *.fit extension in the working directory.
:This program was used to combine output of HMatch.
:C.2.2.2 Requirements
:combine-fit.bat must be located in the same directory as the files to be appended.
:C.2.2.3 User Input
:None required.
:C.2.2.4 Output
:A file named ”combine-fit-output.txt” with the appended *.fit files within. The source files are not modified.
:C.2.2.5 Listing

dir *.fit /b > combine-fit-filelist.txt
FOR %%1 in (*.fit) do type %%1 >> combine-fit-output.txt
