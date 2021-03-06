#!/bin/bash
# Variables
wired=$(ipconfig getifaddr en1)
wireless=$(ipconfig getifaddr en0)
router=$(ipconfig getoption en0 router || ipconfig getoption en1 router)

echo "----------NETWORK INFO---------"

# Check if there is a wired connection
if [ -z "$wired" ]
then
	echo -e "Wired: \e[1m\e[31mNo IP Address Assigned\e[0m"
else
	echo -e "Wired: \e[1m\e[32m$wired\e[0m"
fi

# Check if there is a wireless connection
if [ -z "$wireless" ]
then
	echo -e "Wireless: \e[1m\e[31mNo IP Address Assigned\e[0m"
else
	echo -e "Wireless: \e[1m\e[32m$wireless\e[0m"
fi

if [ -z "$router" ]
then
	echo -e "\e[1m\e[31mNo connection to router\e[0m"
elif [ -z "$(ipconfig getoption en0 router)" ]
then
	echo -e "Router: \e[1m\e[32m(en0) $router\e[0m"
else
	echo -e "Router: \e[1m\e[32m(en1) $router\e[0m"
fi
echo "-------------------------------"
