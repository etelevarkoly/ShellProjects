#!/bin/bash

# user manager tool for exam

echo "Etele user manager tool for exam"

echo "adding groups: vivo, bokszolo, uszo"
groupadd vivo
groupadd bokszolo
groupadd uszo

echo "adding new users: vivo_1, vivo_2, bokszolo_1, bokszolo_2, uszo_1, uszo_2"
useradd vivo_1
useradd vivo_2
useradd bokszolo_1
useradd bokszolo_2
useradd uszo_1
useradd uszo_2

echo "vivo_1 jelszo megadasa:"
passwd vivo_1
echo "vivo_2 jelszo megadasa:"
passwd vivo_2
echo "bokszolo_1 jelszo megadasa:"
passwd bokszolo_1
echo "bokszolo_2 jelszo megadasa:"
passwd bokszolo_2
echo "uszo_1 jelszo megadasa:"
passwd uszo_1
echo "uszo_2 jelszo megadasa:"
passwd uszo_2

echo "adding users to groups"
usermod -a -G vivo vivo_1
usermod -a -G vivo vivo_2
usermod -a -G bokszolo bokszolo_1
usermod -a -G bokszolo bokszolo_2
usermod -a -G uszo uszo_1
usermod -a -G uszo uszo_2

echo "mkdir vivo, bokszolo, uszo"
mkdir -p /home/linuxadmin/vizsgabash/sportolo/{vivo,bokszolo,uszo}
echo "touch files in subfolders"
touch /home/linuxadmin/vizsgabash/sportolo/{vivo,bokszolo,uszo}/randomfile

echo "tulajdonos jogosultsag modositasa"
chown vivo_1:vivo /home/linuxadmin/vizsgabash/sportolo/vivo
chown bokszolo_2:bokszolo /home/linuxadmin/vizsgabash/sportolo/bokszolo
chown uszo_1:uszo /home/linuxadmin/vizsgabash/sportolo/uszo

# mappák jogai
echo "mappak jogosultsagainak modositasa"
chmod 770 /home/linuxadmin/vizsgabash/sportolo/vivo
chmod 750 /home/linuxadmin/vizsgabash/sportolo/bokszolo
chmod 550 /home/linuxadmin/vizsgabash/sportolo/uszo

# fájlok jogai
echo "fajlok jogosultsagainak modositasa"
chmod 760 /home/linuxadmin/vizsgabash/sportolo/vivo/*
chmod 640 /home/linuxadmin/vizsgabash/sportolo/bokszolo/*
chmod 440 /home/linuxadmin/vizsgabash/sportolo/uszo/*

echo "ls -lR jogosultsagok csekkolasa es export"
ls -lR /home/linuxadmin/vizsgabash/sportolo/ >> /home/linuxadmin/vizsgabash/userid

echo "3MB-nal nagyobb fajlok a /var alatt export"
find /var -type f -size +3M -ls >> /home/linuxadmin/vizsgabash/nagyfile

echo "passwd fajl masolasa ./vizsgabash ala"
cp /etc/passwd /home/linuxadmin/vizsgabash

echo -e "\nuszo elso talalat export\n"
cat /home/linuxadmin/vizsgabash/passwd | grep -m 1 uszo >> /home/linuxadmin/vizsgabash/userid
echo -e "\nutolso harom talalat export\n"
cat /home/linuxadmin/vizsgabash/passwd | tail -3 >> /home/linuxadmin/vizsgabash/userid
echo -e "\n1000nel nagyobb UID-k export\n"
cat /home/linuxadmin/vizsgabash/passwd | grep -E ':[1-9][0-9][0-9][0-9]:' >> /home/linuxadmin/vizsgabash/userid







