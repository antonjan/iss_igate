# iss_igate
This repository will have all the code for my automated ISS Igate code.<br>
The ISS have two frequencies for IGATE  437.550mhz and 145.825Mhz<br>
PSAT (NO-84) is much easier to use on 145.825Mhz<br>
Kalibarte your sdr dongle first with the Kal utility<br> 

Kal -s GSM900 then select the strogest station<br>
Kal -c 36<br>
Testing with local APRS<br>
Install mutimon-ng and rtllib<br>
sudo rtl_fm -f 144.800m -M fm -E offset -p 33 -s 22050 -g 42.0 - |multimon-ng -a AFSK1200 -a FSK9600  -a AFSK2400 -A -t raw -<br>
APRS: ZS0ERB-2>APN391,ZS0ERB-5*,WIDE2*:!2614.26S/02822.10E#PHG5400 W3, GAU3-3, Ant:Donated/Rig&PSU:ZS6BUU<br>
APRS: ZS0TRG-1>BEACON,ZS4OIL-1*,ZS0ERB-5*,WIDE3-1:This is the Parys APRS digiPeater <br>
APRS: ZS0TRG-1>APN382,ZS4OIL-1*,ZS0ERB-5*,WIDE3-1:!2654.29SV02724.45E#PHG5360/ Parys VHF 1200 bps (144.800 MHz) APRS Digi<br>
APRS: ZS0ERB-5>APN391:!2623.43S/02800.03E#PHG5430 W3, GAU3-3, PLATBERG WALKERVILLE<br>
APRS: ZS4OIL-1>ID,ZS0ERB-5*,WIDE3-2:ZS4OIL-1/R ZS4OIL-3/G<br>
