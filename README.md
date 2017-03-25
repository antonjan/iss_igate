# iss_igate
This repository will have all the code for my automated ISS Igate code.<br>
The ISS have two frequencies for IGATE  437.550mhz and 145.825Mhz<br>
PSAT (NO-84) is much easier to use on 145.825Mhz<br>
Kalibarte your sdr dongle<br> 

Kal -s GSM900 then select the strogest station<br>
Kal -c 36<br>
Testing with local APRS<br>
Install mutimon-ng and rtllib
sudo rtl_fm -f 144.800m -M fm -E offset -p 33 -s 22050 -g 42.0 - |multimon-ng -a AFSK1200 -a FSK9600  -a AFSK2400 -A -t raw -
