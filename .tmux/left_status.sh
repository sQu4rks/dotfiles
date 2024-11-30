function ip_address() {
		ip=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
		echo $ip
}

function mem_usage() {
	# Get free memory
	free_memory=$(vm_stat|grep "Pages free:"|cut -d ":" -f2)
	free_memory=${free_memory// /}
	free_memory=${free_memory/./}
	
	# Convert pages into MB
	free_memory=$(($free_memory*4096/1024/1024))

	# Get total memory
	

	echo "$free_memory MB"


}

ip=$(ip_address)
mem=$(mem_usage)

echo "$ip $mem"
