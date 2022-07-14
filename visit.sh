#!/bin/bash

echo "Enter patient visit details"

#get patient visiting patient
read -p "Patient First Name:" first_name
read -p "Patient Surname:" surname
read -p "Patient Date of Birth (23/12/2001):" dob

cd ..
cd patients

first_letter=${first_name:0:1}
last_letter=${surname: -1}
date_of_birth=${dob///}

#gets the directory of patient
directory=$first_letter$last_letter$date_of_birth
cd $directory

#gets visit details
read -p "Date of Visit (23/12/2001):" dov
read -p "Doctor Username Examined:" doctor_examined

string=`cat pbasicinfo.log`
IFS=, paths=($string)
u="$USER"

read -p "Health Issue:" health_issue
read -p "Medication:" medication
read -p "Dosage:" dosage

#checks if current doctor running script is apart of patients registered doctors
if [[ " ${paths[@]} " =~ " ${u} " ]]; then
    #writes to pmedicalrecord log will append to file if visit info is already in there
    echo "$dov,$doctor_examined,$health_issue,$medication,$dosage" >> pmedicalrecord.log
    #one way which i have blocked access to pmedicalrecord.log file for unregistered doctors
    chmod 500 pmedicalrecord.log
else
    echo "Current doctor not in the list of registered doctors for patient"
fi


