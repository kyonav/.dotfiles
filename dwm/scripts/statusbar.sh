#! /bin/sh

format_text(){
    echo -e $1
    echo -e $2

}

read_chars(){
    declare -A date

    date[day]="$(date +"%a, %b %d")"
    date[time]="$(date +"%l:%M:%S %p")"
    
    timetime=()
    datedate=()

    count=0
    for key in "${date[@]}"; do
        #echo -e "${key}"

        for char in $(echo -n "$key" | fold -w1); do
            #echo -e "$char"

            if [[ $char =~ ^[0-9]$ ]]; then
                echo -e $((char))     
                
                for ((i=0; i< ${#timeNdate[@]}; i++)); do
                    if [[ i< 5 ]]; then
                        timetime+=$((char))        
                        echo -e $((char))
                        echo -e $timetime

                    else
                        datedate+=$((char))
                    
                    fi
                done
            else
                continue

            fi
        done
    done

    format_text $timetime $datedate

#    format_text $timeNdate
#    for d
#        for char in "${string}"; do
#            int_chars= ["${string:char:1}";

}

dte(){ # adding date overlay



    echo -e "$dte"
    dte="$(date +"  %a, %b %d |  %l:%M:%S %p ")"
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

#while true; do # outputing and updating the overlays
#    xsetroot -name "| $(cpu) | $(mem) | $(dte) "
#    sleep 1s # update every sec
#
#done &

read_chars
