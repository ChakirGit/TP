#!/bin/bash
ALIAS=cas
KEY_STORE=/etc/cas/thekeystore
#KEY_STORE=thekeystore
TRUST_STORE=/etc/cas/trustStore
#TRUST_STORE=trustStore
if [ ! -f $ALIAS.crt ]; then
  echo "KEY_STORE=$KEY_STORE"
  keytool -exportcert -rfc -alias $ALIAS -keystore $KEY_STORE -storepass changeit -file $ALIAS.crt
fi
if [ ! -f $TRUST_STORE ]; then
  echo "TRUST_STORE=$TRUST_STORE"
  keytool -import -alias $ALIAS -keystore $TRUST_STORE -storepass changeit -trustcacerts -file $ALIAS.crt
fi
keytool -list -v -alias $ALIAS -keystore $TRUST_STORE -storepass changeit
