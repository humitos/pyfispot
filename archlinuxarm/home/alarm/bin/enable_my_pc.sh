#!/bin/bash

iptables -I internet 1 -t mangle -m mac --mac-source c4:85:08:b5:a1:62 -j RETURN
