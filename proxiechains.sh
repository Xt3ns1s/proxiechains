#!/bin/bash

clear

echo "This script is for using proxychains easier"

options="TorConfig StartProxychains EditProxychainsConfig CheckForLeaks CheckExternalIP Exit"
select option in $options; do
	case $option in

		TorConfig)
		clear
		options="StartTor CheckTor StopTor MainMenu"
		select option in $options; do
		case $option in
		
		#start tor
		StartTor)
		clear
		echo "Starting tor service"
		sudo service tor start 
		echo "Tor service started"
		;;

		#check tor status
		CheckTor)
		clear
		echo "checkinging tor status..."
		echo "crtl+c to exit status"
		xterm -hold -e sudo service tor status
		;;

		#stop tor
		StopTor)
		clear
		echo "Stopping tor service"
		sudo service tor stop
		;;
		
		#break to main menu
		MainMenu)
		clear
		break
		;;

		*)
		echo "invalid character"
		clear
		;;

		esac
		done
		;;
			#proxychains app menu
			StartProxychains)
			clear
			options="Start_Proxychains_With_Firefox Start_Proxychains_With_Nmap Start_Any_App_With_Proxychains MainMenu"
			select option in $options; do
				case $option in
		
			#start proxychains with firefox
			Start_Proxychains_With_Firefox)
			clear
			echo "Starting proxychains with firefox"
			read -p "Website address: " website
			xterm -hold -e proxychains firefox $website
			;;
	
			#start nmap scan with proxychains 
			Start_Proxychains_With_Nmap)
			clear
			echo "Starting proxychains with nmap"
			read -p "ip or website address: " target
			xterm -hold -e proxychains nmap $target
			;;
			
			#start any app with proxychains, name has to be exact
			Start_Any_App_With_Proxychains)
			clear
			read -p "Enter name of app to start with proxychains: " app
			xterm -hold -e proxycains $app
			;;
			
			#back to main menu
			MainMenu)
			clear
			break
			;;
		
			*)
			echo "invalid character"
			clear
			;;
		
			esac
			done
			;;
	
	#edit proxychains config file with nano
	EditProxychainsConfig) 
	clear 
	sudo nano /etc/proxychains.conf
	;;

	#check dnsleaktest.com for leaks
	CheckForLeaks)
	clear
	echo "checking for dns leaks"
	xterm -hold -e proxychains firefox www.dnsleaktest.com
	;;

	#Check current public ip
	CheckExternalIP)
	clear
	curl ident.me
	;;

	Exit)
	clear
	exit
	;;
esac
done
