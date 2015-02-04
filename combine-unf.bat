:C.2.3.1 Summary
:combine-unf.bat appends all files with a *.unf extension in the working directory.  This program was used to combine output of HAngle.
:C.2.3.2 Requirements
:combine-unf.bat must be located in the same directory as the files to be appended.
:C.2.3.3 User Input
:None required.
:C.2.3.4 Output
:A file named ”combine-unf-output.txt,” containing the appended *.unf files, is produced. The source files are not modified.
:C.2.3.5 Listing

dir *.unf /b > combine-unf-filelist.txt
FOR %%1 in (*.unf) do type %%1 >> combine-unf-output.txt
