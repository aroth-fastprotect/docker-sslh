#!/bin/sh

opts=''

if [ ! -z "$SSL_HOST" ]; then
    opts="$opts --tls $SSL_HOST:$SSL_PORT"
fi
if [ ! -z "$SSH_HOST" ]; then
    opts="$opts --ssh $SSH_HOST:$SSH_PORT"
fi
if [ ! -z "$OPENVPN_HOST" ]; then
    opts="$opts --openvpn $OPENVPN_HOST:$OPENVPN_PORT"
fi

sslh -f -u root \
    --listen $LISTEN_IP:$LISTEN_PORT \
    $opts $@
