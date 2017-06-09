#!/bin/bash
NAME=${NAME:='dnsmasq'}
PORT=${PORT:='53'}
if [[ "$1" ]]; then
    NAME=$1
fi
if [[ "$2" ]]; then
    PORT=$2
fi

cat <<EOF >./0-test.conf
address=/name1.test.org/192.168.1.101
address=/name2.test.org/192.168.1.102
EOF

echo ">> run ${NAME} and listen on ${PORT} <<"
docker run -d                                           \
           --cap-add=NET_ADMIN                          \
           --name ${NAME}                               \
           --hostname ${NAME}                           \
           -p ${PORT}:53/tcp                            \
           -p ${PORT}:53/udp                            \
           -v $(pwd)/0-test.conf:/etc/dnsmasq.d/0.test.conf  \
           jack6liu/dnsmasq:2.76

