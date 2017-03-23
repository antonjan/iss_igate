#Run for a satelite
#https://github.com/the2belo/wxsat-scheduler
#wget -qr www.celestrak.com/NORAD/elements/weather.txt -O ~/wxsat/weather.txt
wget -qr www.celestrak.com/NORAD/elements/amateur.txt -O ~/iss_igate/amateur.txt
sudo ./iss-scheduler.sh (ZARYA) 437.550
# iss 437.550 and  145.825
#ISS (ZARYA) – 145.825 MHz
sudo echo "<html><body>" > ~/iss_igate/ISS_schedule.html
sudo at -l >> ~/iss_igate/images/ISS_schedule.html
sudo echo "</body></html>" >> ~/iss_igate/images/ISS_schedule.html
