#!/bin/bash
#To create a directory named ProjectData in user's home directory
clear
cd
if [ ! -d ProjectData ]; then
   echo "projectData does not exist. Creating it..."
   mkdir ProjectData
else
   echo "ProjectData directory exists"
fi
cd ProjectData
#To create three directories inside the projectData
if [ ! -d Reports ];then
   echo "Reports does not exist. Creating it..."
   mkdir Reports
else
   echo "Reports directory exists"
fi
if [ ! -d Logs ];then
   echo "Logs does not exist. Creatig it..."
   mkdir Logs
else
   echo "Logs directry exists"
fi
if [ ! -d Data ];then
   echo "Data does not exist. Creating it..."
   mkdir Data
else
   echo "Data directory exists"
fi
echo "The three sub-directories are created"
ls -l
#To create 10 files inside Data
cd Data
for i in {1..10}
do
     if [ ! -e file$i.txt ];then
   touch file$i.txt
   echo -e "This is a file named file$i \n this is second line" >> file$i.txt
     else
        rm file$i.txt
        touch file$i.txt
        echo -e "This is a file named file$i \n this is second line" >> file$i.txt
     fi
done
echo "In the Data directory 10 files are created"
cd ..
cd Reports
#To count number of lines in each file
if [ -e summary.txt ]; then
  echo -e  "summary file exist.\n Removing it and creating a new one"
  rm summary.txt
  touch summary.txt
else
   touch summary.txt
fi
#File Processing
cd ..
cd Data
for i in {1..10}
do
   echo "file$i : No of lines in file$i is $(wc -l file$i.txt)"  >>  ~/ProjectData/Reports/summary.txt
done
cat ~/ProjectData/Reports/summary.txt
#creating the logdata file
cd ..
cd Logs
if [ ! -e logdata.txt ]; then
   touch logdata.txt
else
   echo "The time and date when the program is running is $(date)" >> logdata.txt
fi
cat logdata.txt