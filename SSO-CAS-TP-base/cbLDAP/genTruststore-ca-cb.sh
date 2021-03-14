#!/bin/sh
ALIAS=ca-cb
TRUST_STORE=/etc/cas/trustStore
#TRUST_STORE=trustStore
echo "TRUST_STORE=$TRUST_STORE"
if [ $# -eq 0 ]; then
  keytool -import -alias $ALIAS -keystore $TRUST_STORE -storepass changeit -trustcacerts -file $ALIAS.crt
  keytool -v -list -alias $ALIAS -keystore $TRUST_STORE -storepass changeit
  #keytool -delete -alias $ALIAS -keystore $TRUST_STORE -storepass changeit
else
  keytool -list -keystore $TRUST_STORE -storepass changeit
fi
