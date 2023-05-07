#!/bin/bash

# bash script for exam
# run with sudo only

echo "welcome, initializing script..."
echo "creating vizsga2022 folder with the specified subfolders..."
mkdir -p /home/vizsga2022/szakosztalyok/{vivas,uszas,birkozas}
echo "creating test files for permission test..."
touch /home/vizsga2022/szakosztalyok/{vivas,uszas,birkozas}/test_file01
echo "folders created under /home"

echo "creating groups: vivok, uszok, birkozok..."
groupadd vivok
groupadd uszok
groupadd birkozok
echo "groups created"

echo "creating new users: vivo_1, vivo_2, bokszolo_1, bokszolo_2, uszo_1, uszo_2"
useradd fuchs_jeno
useradd posta_sandor
useradd piller_gyorgy
useradd egerszegi_krisztina
useradd darnyi_tamas
useradd cseh_laszlo
useradd varga_janos
useradd repka_attila
useradd farkas_peter

echo "add password for fuchs_jeno:"
passwd fuchs_jeno
echo "add password for posta_sandor:"
passwd posta_sandor
echo "add password for piller_gyorgy:"
passwd piller_gyorgy
echo "add password for egerszegi_krisztina:"
passwd egerszegi_krisztina
echo "add password for darnyi_tamas:"
passwd darnyi_tamas
echo "add password for cseh_laszlo:"
passwd cseh_laszlo
echo "add password for varga_janos:"
passwd varga_janos
echo "add password for repka_attila:"
passwd repka_attila
echo "add password for farkas_peter:"
passwd farkas_peter

echo "passwords set, users created."

echo "adding users to groups"
usermod -a -G vivok fuchs_jeno
usermod -a -G vivok posta_sandor
usermod -a -G vivok piller_gyorgy
usermod -a -G uszok egerszegi_krisztina
usermod -a -G uszok darnyi_tamas
usermod -a -G uszok cseh_laszlo
usermod -a -G birkozok varga_janos
usermod -a -G birkozok repka_attila
usermod -a -G birkozok farkas_peter
echo "users added to the specified groups."

echo "setting owner groups for created subfolders..."
chgrp vivok  /home/vizsga2022/szakosztalyok/vivas/
chgrp uszok /home/vizsga2022/szakosztalyok/uszas/
chgrp birkozok /home/vizsga2022/szakosztalyok/birkozas/
echo "owner groups for subfolder has been set."

echo "setting permissions for created subfolders..."
chmod 770 /home/vizsga2022/szakosztalyok/vivas/
chmod 770 /home/vizsga2022/szakosztalyok/uszas/
chmod 750 /home/vizsga2022/szakosztalyok/birkozas/
echo "permissions for created subfolders has been set."

echo "setting permissions for test-files in the created subfolders..."
chmod 770 /home/vizsga2022/szakosztalyok/vivas/*
chmod 770 /home/vizsga2022/szakosztalyok/uszas/*
chmod 750 /home/vizsga2022/szakosztalyok/birkozas/*
echo "permissions for test-files has been set."

# check permissions
# ls -lR /home/vizsga20222/szakosztalyok

echo "list files:"
find /usr/lib -type f -size +10M -ls

echo "/etc/passwd head -3:"
head -3 /etc/passwd
echo ""
echo "/etc/passwd tail -2:"
tail -2 /etc/passwd
echo ""
echo "/etc/passwd | grep var:"
cat /etc/passwd | grep var
echo ""

echo "done."















