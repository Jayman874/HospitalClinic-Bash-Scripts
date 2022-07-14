#!/bin/bash

echo "Enter the following information about the patient:"

#gets user input
read -p "First name:" first_name
read -p "Surname:" surname
read -p "Date of birth (23/12/2001):" dob
read -p "Gender:" gender
read -p "Physical address:" physical_address
read -p "Email:" email
read -p "Phone Number:" phone_number
read -p "Registered doctors (enter username seperated by comma (,):" registered_doctors

cd ..
cd patients

#gets first letter of first name
first_letter=${first_name:0:1}
#gets last letter of last name
last_letter=${surname: -1}
#removes all slashes from date of birth
date_of_birth=${dob///}

directory=$first_letter$last_letter$date_of_birth
#make new directory with first letter or first name last letter of last name and date of birth with no slashes
mkdir -p $directory

#cd in newly created directory put user details into pbasicinfo.log
cd $directory
echo "$first_name,$surname,$dob,$gender,$physical_address,$email,$phone_number,$registered_doctors" > pbasicinfo.log