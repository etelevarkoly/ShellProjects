#!/bin/bash

# bash script 02

mkdir /home/vizsga2022_mon
munkamappa='/home/vizsga2022_mon'
touch /home/vizsga2022_mon/vizsga_monitor.txt
monitor='/home/vizsga2022_mon/vizsga_monitor.txt'

echo "***" > $monitor
echo "*" >> $monitor
echo "* Nevem : Etele Várkoly" >> $monitor
echo "* Dátum : $(date)" >> $monitor
echo "* Számítógép : $(hostname)" >> $monitor
echo "***" >> $monitor

hostname -i >> $monitor
echo "127.0.0.1" >> $monitor

cat /etc/group >> $monitor
cat /etc/passwd >> $monitor

mkdir /home/vizsga2022_mon/szoveg

# there are no .txt files under /var/, so I copied .logs
cp /var/log/*.log $munkamappa/szoveg

mkdir $munkamappa/web
touch $munkamappa/web/main.html
echo "Záró vizsga" >> $munkamappa/web/main.html

rm -rf $munkamappa

