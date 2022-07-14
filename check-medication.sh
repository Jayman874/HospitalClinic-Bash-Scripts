#!/bin/bash

cd ..
cd patients

#loops through all directories in patients
for d in */ ; do
    cd $d
    #checks if patient has pmedicalrecord in their directory
    if [[ -f pmedicalrecord.log ]]
    then	
            echo "---------------------------------------------------------------"
            echo "Doctor's Username/s: "$doctor
            string=`cat pmedicalrecord.log`
            #gets doctors username from pmedicalrecord.log
            doctor= cut -d , -f 2 <<< $string
            echo "Medication given by doctor/s (In Order):"$medication
            #gets medication given by doctor in pmedicalrecord.log
            medication= cut -d , -f 4 <<< $string
            cd ..
    else
            #if pmedicalrecord.log does not exist exit current directory
            cd ..
    fi
done
