		#/bin/bash
		VAR1=$(docker ps |awk 'NR==2 {print $11}')
		sleep 6 && docker container rm -f $VAR1
