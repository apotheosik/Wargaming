#kills ICMP for the length of the check, then re-enables it 
#infuriatingly random- can obfuscate?

# */5 == every five minutes
# sudo su */5 * * * * ~/cronPin.sh

function killping() {
    while:
      echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
      sleep 1m
      echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
      sleep 1m
}
