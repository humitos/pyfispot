iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F
iptables -X internet -t mangle

# iptables-restore < /etc/iptables.ipv4.nat

