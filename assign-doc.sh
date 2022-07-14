#!/bin/bash

cd ..
cd patients

read -p "Patient First Name:" first_name
read -p "Patient Last Name:" last_name
read -p "Patient Date of Birth (23/12/2001):" dob

#gets first letter of first name
first_letter=${first_name:0:1}
#gets last letter of last name
last_letter=${last_name: -1}
#removes all slashes from date of birth
date_of_birth=${dob///}

# gets patients directory then cd into it
directory=$first_letter$last_letter$date_of_birth
cd $directory

read -p "Registered Doctor's username to assign to patient:" doctor

#appends doctor to the end of pbasicinfo.log file
sed -i s/$/","$doctor/ pbasicinfo.log