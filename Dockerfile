#
# dnsmasq
#
FROM        alpine:3.5
LABEL       vendor="jack6.liu"                      \
            version="2.76"
RUN         apk update &&                           \
            apk --no-cache add dnsmasq &&           \
            echo "conf-dir=/etc/dnsmasq.d,*.conf" > /etc/dnsmasq.conf &&  \
            rm -rf /var/cache/apk/*
EXPOSE      53/tcp 53/udp
CMD         dnsmasq -k --log-facility=-

