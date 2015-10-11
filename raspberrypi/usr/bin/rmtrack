/usr/sbin/conntrack -L \
    |grep $1 \
    |grep ESTAB \
    |grep 'dport=80' \
    |awk \
        "{ system(\"conntrack -D --orig-src $1 --orig-dst \" \
            substr(\$6,5) \" -p tcp --orig-port-src \" substr(\$7,7) \" \
            --orig-port-dst 80\"); }"

