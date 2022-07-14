#!/bin/bash

#acls for WellingtonClinic directory
sudo setfacl -R -m d:g:administrators:rwx /opt/WellingtonClinic
sudo setfacl -R -m g:administrators:rwx /opt/WellingtonClinic
sudo setfacl -R -m o:--- /opt/WellingtonClinic
sudo setfacl -m g:nurses:rx /opt/WellingtonClinic
sudo setfacl -m g:doctors:rx /opt/WellingtonClinic
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic

#acls for scripts
sudo setfacl -m g:nurses:rx /opt/WellingtonClinic/scripts
sudo setfacl -m g:doctors:rx /opt/WellingtonClinic/scripts
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts

#acls for all scripts
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts/register-patient.sh
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts/assign-doc.sh
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts/searchpatient.sh
sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts/searchdoctor.sh
sudo setfacl -m g:doctors:rx /opt/WellingtonClinic/scripts/visit.sh
sudo setfacl -m g:doctors:r /opt/WellingtonClinic/scripts/check-medication.sh
sudo setfacl -m g:nurses:rx /opt/WellingtonClinic/scripts/check-medication.sh

#acls for staff
sudo setfacl -R -m g:nurses:rx /opt/WellingtonClinic/staff
sudo setfacl -R -m g:doctors:rx /opt/WellingtonClinic/staff
sudo setfacl -R -m g:receptionists:rx /opt/WellingtonClinic/staff

#acls for all staff sbasicinfo.log
cd /opt/WellingtonClinic/staff
for d in */ ; do
    cd $d
    for dd in */ ; do
       cd $dd
       sudo setfacl -m g:nurses:r-- sbasicinfo.log
       sudo setfacl -m g:doctors:r-- sbasicinfo.log
       sudo setfacl -m g:receptionists:r-- sbasicinfo.log
       cd ..
    done
    cd ..
done

#acls for all patient directory
sudo setfacl -m g:nurses:rx /opt/WellingtonClinic/patients
sudo setfacl -m g:doctors:rx /opt/WellingtonClinic/patients
sudo setfacl -m g:receptionists:rwx /opt/WellingtonClinic/patients

#acls for pbasicinfo.log and pmedicalrecord.log
cd /opt/WellingtonClinic/patients
#checks if directory contains subdirectories
ls /opt/WellingtonClinic/patients/*/ >/dev/null 2>&1 ; 
if [ $? == 0 ];
then 
    for d in */ ; do
       sudo setfacl -m g:nurses:rx /opt/WellingtonClinic/patients/$d
       sudo setfacl -m g:doctors:rwx /opt/WellingtonClinic/patients/$d
       sudo setfacl -m g:receptionists:rx /opt/WellingtonClinic/patients/$d
       sudo setfacl -m d:g:nurses:r-- /opt/WellingtonClinic/patients/$d
       cd $d
       if [[ -f pbasicinfo.log ]]
       then
          sudo setfacl -m g:nurses:r-- pbasicinfo.log
          sudo setfacl -m g:doctors:r-- pbasicinfo.log
          sudo setfacl -m g:receptionists:rw- pbasicinfo.log
       fi
       #if patient has a pmedicalrecord.log file then check if user trying to access it is a patients registered doctor
       if [[ -f pmedicalrecord.log ]]
       then
          string=`cat pbasicinfo.log`
          IFS=, paths=($string)
          for (( i=7; i<${#paths[@]}; i++ ))
          do
             sudo setfacl -m u:${paths[i]}:rw- pmedicalrecord.log
          done
          sudo setfacl -m g::--- pmedicalrecord.log
          sudo setfacl -m g:nurses:r-- pmedicalrecord.log
          sudo setfacl -m g:doctors:--- pmedicalrecord.log
          sudo setfacl -m g:receptionists:--- pmedicalrecord.log
       fi
       cd ..
   done
fi