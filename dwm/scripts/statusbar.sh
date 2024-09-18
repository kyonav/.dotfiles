#! /bin/sh

dte(){ # adding date overlay
    dte="$(date +"  %a, %b %d |  %l:%M:%S %p ")"
    echo -e "$dte"
}

mem(){ # adding memory overlay
    mem=`free | awk '/Mem/ {printf " %d / %d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
    echo -e "$mem"

}

cpu(){ # adding cpu overlay
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo -e "  $cpu%"

}

while true; do # outputing and updating the overlays
    xsetroot -name "| $(cpu) | $(mem) | $(dte) "
#    sleep 1s # update every sec

done &
