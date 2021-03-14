#!/bin/sh
echo "Generating keys for CAS server..."
echo "Append this to /etc/cas/config/cas.properties..."
echo "  by Christophe BORELLY @ IUT Beziers"
echo
EKEY=$(openssl rand -base64 32)
SKEY=$(openssl rand -base64 64 | tr -d '\n')
WEKEY=$(openssl rand -base64 16)
WSKEY=$(openssl rand -base64 64 | tr -d '\n')
echo "cas.tgc.crypto.encryption.key=$EKEY"
echo "cas.tgc.crypto.signing.key=$SKEY"
echo "cas.webflow.crypto.encryption.key=$WEKEY"
echo "cas.webflow.crypto.signing.key=$WSKEY"
