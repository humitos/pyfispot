# Nexus 5
iptables -I internet 1 -t mangle -m mac --mac-source f8:a9:d0:1d:eb:a0 -j RETURN
# USB Ethernet adaptor
iptables -I internet 1 -t mangle -m mac --mac-source 00:e0:4c:53:44:58 -j RETURN
# Dell XPS wireless card
iptables -I internet 1 -t mangle -m mac --mac-source c4:85:08:b5:a1:62 -j RETURN
# Samsung wireless card
iptables -I internet 1 -t mangle -m mac --mac-source 50:b7:c3:51:11:c7 -j RETURN
