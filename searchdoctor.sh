#!/bin/bash

read -p "Patient's First Name:" first_name
read -p "Patient's Last Name:" last_name
read -p "patient's Date of Birth (23/12/2001):" dob

cd ..
cd patients

#gets first letter of first name
first_letter=${first_name:0:1}
#gets last letter of last name
last_letter=${last_name: -1}
#removes all slashes from date of birth
date_of_birth=${dob///}

directory=$first_letter$last_letter$date_of_birth
cd $directory

string=`cat pbasicinfo.log`
IFS=, paths=($string)
cd ../../staff/doctors
echo "Patient:"
echo "$first_name" "$last_name"
echo " "

echo "Doctor/s:"
#gets all the doctors assigned to a patient after 7 commas
for (( i=7; i<${#paths[@]}; i++ ))
do
   cd ${paths[i]}
   doc_string=`cat sbasicinfo.log`
   #gets the doctors name
   doc_name= cut -d , -f 1 <<< $doc_string
   #prints out doctors name and username
   echo ${paths[i]}","
   echo $doc_name
   cd ..
done