#!/bin/bash
#get TLE keps
wget -qr www.celestrak.com/NORAD/elements/amateur.txt -O ~/iss_igate/amateur.txt
#clear array
unset var1[@]

if [ -z $1 ]; then
    echo "Must specify which bird"
    exit 1
fi
if [ -z $2 ]; then
    echo "Must specify frequency in MHz"
    exit 1
fi

#get command line arg for bird/freq
bird=$1
freq=$2

#calculate best passes
cat ~/iss_igate/amateur.txt
cat ~/.predict/predict.qth
for i in {00..23}
do
var1[10#$i]=$(predict -t ~/iss_igate/amateur.txt -q ~/.predict/predict.qth -p "ISS (ZARYA)" $(date -d "+$i hour" +%s) | awk '{ if($5>=30) print $0}' |sort -u | head -1)
echo predict -t ~/iss_igate/amateur.txt -q ~/.predict/predict.qth -p "ISS (ZARYA)" $(date -d "+$i hour" +%s) | awk '{ if($5>=30) print $0}' |sort -u | head -1
done

#calculate start-end for each pass
for x in $(printf -- '%s\n' "${var1[@]}" | grep : | awk '{print $1,$3$4}' | cut -d : -f 1,2 | sort -uk 2 | awk '{print $1}')
do
recstart=$(predict -t ~/iss_igate/amateur.txt -q ~/.predict/predict.qth -p "ISS (ZARYA)" $x | awk '{ if($5>=10) print $0}' | head -1 | awk '{print $1}')
recend=$(predict -t ~/iss_igate/amateur.txt -q ~/.predict/predict.qth -p "ISS (ZARYA)" $x | awk '{ if($5>=10) print $0}' | tail -1 | awk '{print $1}')
rectime=$(awk "BEGIN {print $recend-$recstart}")
init=$(date -d "@$recstart" +%y%m%d%H%M)
echo '$init'
#create at file
cat << EOF > ~/iss_igate/iss.at
recdate=\$(date +%Y%m%d-%H%M)
mapdate=\$(date '+%d %m %Y %H:%M')
timeout $rectime /usr/local/bin/rtl_fm -d 0 -f ${freq}M -s 48000 -g 49.6 -p -31 -F 9 -A fast -E DC ~/iss_igate/recordings/ISS-\$recdate.raw
/usr/bin/sox -t raw -r 48000 -es -b16 -c1 -V1 ~/iss_igate/recordings/ISS-\$recdate.raw ~/iss_igate/recordings/ISS-\$recdate.wav rate 11025
touch -r ~/iss_igate/recordings/ISS-\$recdate.raw ~/iss_igate/recordings/ISS-\$recdate.wav
echo /usr/bin/sox -t raw -r 48000 -es -b16 -c1 -V1 ~/iss_igate/recordings/ISS-\$recdate.raw ~/iss_igate/recordings/ISS-\$recdate.wav rate 11025
touch -r ~/iss_igate/recordings/ISS-\$recdate.raw ~/iss_igate/recordings/ISS-\$recdate.wav
rm ~/iss_igate/recordings/ISS-\$recdate.raw
EOF
#schedule at
at -f ~/iss_igate/iss.at -t $init
done

#clear array
unset var1[@]
