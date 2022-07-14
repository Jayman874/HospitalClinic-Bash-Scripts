#!/bin/bash

#declare array to store the patients
declare -a patientArray=()

read -p "Doctors Username:" doctor

cd ../staff/doctors/$doctor

string=`cat sbasicinfo.log`
echo "Doctor:"
#gets doctor's name from doctor's sbasicinfo.log
doctor_name= cut -d , -f 1 <<< $string
echo "$doctor_name ($doctor)"

cd ../../../
cd patients

echo "Patient/s:"
for d in */ ; do
    cd $d
    #checks all patients logged in the patients folder
    #checks if doctors name is in patients pbasicinfo.log
    if grep -q "$doctor" pbasicinfo.log; then
            #if doctor's name is in patients pbasicinfo.log get patient first and last name
            string=`cat pbasicinfo.log`
            first_name= cut -d , -f 1 <<< $string
            last_name= cut -d , -f 2 <<< $string
            name=$first_name$last_name
            #add patients to an array
            patientArray+=$name
            cd ..
    else
            cd ..
    fi
done

#prints out all patients with specified registered doctor
echo "${patientArray[@]}"