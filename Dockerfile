FROM alpine:edge

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ sslh

ADD entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

ENV LISTEN_IP=0.0.0.0 \
    LISTEN_PORT=80 \
    SSL_HOST=localhost \
    SSL_PORT=443 \
    OPENVPN_HOST=localhost \
    OPENVPN_PORT=1194 \
    SSH_HOST=localhost \
    SSH_PORT=22

ENTRYPOINT ["/usr/local/bin/entry.sh"]
