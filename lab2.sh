#!/bin/bash
#Z2.1
mkdir -p $1

#Z2.2
mkdir $1/D1/
mkdir $1/D2/
mkdir $1/D3/
mkdir $1/D4/

touch $1/D2/F1.txt
touch $1/D3/F1.txt
touch $1/D4/F1.txt

#Z2.3
ln -s /etc/passwd $1/D1/passwd_link 

#Z2.4
readlink -f passwd_link #$1/D1/passwd_link

#Z2.5
ln $1/D3/F1.txt $1/D2/F2.txt

#Z2.6
chmod 600 $1/D2/F2.txt

#Z2.7
chown :users $1/D2/F2.txt

#Z2.8
chgrp users $1/D3/

#Z2.9
chmod a-x $1/D3/

#Z2.10
chmod a-w $1/D2/

#Z2.11
chmod a-r $1/D4/

#Z2.12
chmod +t $1/D4/

#Z2.13
touch $1/D4/scr.sh
chmod ug+x $1/D4/scr.sh

#Z2.14
chmod ug+s $1/D4/scr.sh
