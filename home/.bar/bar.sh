#!/usr/bin/bash
msg="Hello World"
left="%{l}%{Fwhite}$msg%{F-}"

# Define the clock
Clock() {
    DATE=$(date "+%a %b %d, %T")
    echo -n "$DATE"
}

centre="%{c}%{Fyellow}\$(Clock)%{F-}"

# Print the clock - this is just the general loop that updates
# everything once a second
while true; do
    eval "echo \"$left $centre\""
    sleep 1;
done
