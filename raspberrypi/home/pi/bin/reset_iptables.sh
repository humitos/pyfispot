iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F

# iptables-restore < /etc/iptables.ipv4.nat

