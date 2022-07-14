#!/bin/bash

#create groups for each role 
groupadd -f doctors
groupadd -f nurses
groupadd -f receptionists
groupadd -f administrators

#create doctors
cd ..
cd staff/doctors

#creates directory sets primary group to doctors
mkdir -p mate1997
useradd -m -d /home/mate1997/ -g doctors mate1997
usermod -a -G doctors mate1997
cd mate1997
# echos details into sbasicinfo.log
echo "Mary Teresa,03/08/1953,1997,173 Rnd street Kelburn,m.theresa@yahoo.com,04528293" > sbasicinfo.log
cd ..

mkdir -p brki2018
useradd -m -d /home/brki2018/ -g doctors brki2018
usermod -a -G doctors brki2018
cd brki2018
echo "Breana Kipling,03/08/1991,2018,4548 River Road HugoTown Auckland 5513,szzh8@tempmail.net,071943668" > sbasicinfo.log
cd ..

mkdir -p mada1993
useradd -m -d /home/mada1993/ -g doctors mada1993
usermod -a -G doctors mada1993
cd mada1993
echo "Mandy Dannel,15/12/1965,1993,343 Norma Avenue Dayton Napier 6731,mandydl@gmail.com,052637445" > sbasicinfo.log
cd ..

mkdir -p labo2002
useradd -m -d /home/labo2002/ -g doctors labo2002
usermod -a -G doctors labo2002
cd labo2002
echo "Lance Bourne,07/04/1970,2002,25 Ferguson Street Franklin Greytown 8567,lancb@outlook.com,083736456" > sbasicinfo.log
cd ..

#create nurses
cd /opt/WellingtonClinic/staff/nurses

mkdir -p lubl2004
useradd -m -d /home/lubl2004/ -g nurses lubl2004
usermod -a -G nurses lubl2004
cd lubl2004
echo "Lucia Blakeley,11/09/1980,2004,935 Massachusetts Avenue Hamilton 4562,lucyblak@outlook.com,38347463" > sbasicinfo.log
cd ..

mkdir -p phmc2008
useradd -m -d /home/phmc2008/ -g nurses phmc2008
usermod -a -G nurses phmc2008
cd phmc2008
echo "Phil McGraw,15/04/1984,2008,45 Razyn Street Petone Lower Hutt 8435,philmcg@gmail.com,02384756" > sbasicinfo.log
cd ..

#create receptionists
cd /opt/WellingtonClinic/staff/receptionists

mkdir -p ansm2002
useradd -m -d /home/ansm2002/ -g receptionists ansm2002
usermod -a -G receptionists ansm2002
cd ansm2002
echo "Andy Smith,13/09/1974,2002,58 Foster avenue Wellington 5011,smith.andy74@gmail.com,07284756" > sbasicinfo.log
cd ..

mkdir -p lubl2004
#adds user as a receptionists by assigning it a secondary group since they are already a nurse
usermod -a -G receptionists lubl2004
cd lubl2004
echo "Lucia Blakeley,11/09/1980,2004,935 Massachusetts Avenue Hamilton 4562,lucyblak@outlook.com,38347463" > sbasicinfo.log
cd ..

mkdir -p phmc2008
usermod -a -G receptionists phmc2008
cd phmc2008
echo "Phil McGraw,15/04/1984,2008,45 Razyn Street Petone Lower Hutt 8435,philmcg@gmail.com,02384756" > sbasicinfo.log
cd ..

#add administrators
cd /opt/WellingtonClinic/staff/administrators

mkdir -p pasa1995
useradd -m -d /home/pasa1995/ -g administrators pasa1995
#adds administrator to multiple groups since they belong to more than one group
usermod -a -G administrators,root,sudo pasa1995
cd pasa1995
echo "Pauline Sanderson,08/03/1993,1995,2452 Randolph Street Bedford Auckland 7752,paulsand@admins.co.nz,03747543" > sbasicinfo.log
cd ..
