#!/bin/sh
JAVA_HOME=/usr/lib64/java
#JAVA_HOME=/home/cb/L3-SSO-CAS/jdk-11.0.2
CATALINA_HOME=/root/apache-tomcat-9.0.43
TRUST_STORE=/etc/cas/trustStore
CATALINA_OPTS=$CATALINA_OPTS" -Djavax.net.ssl.trustStore=$TRUST_STORE"
#CATALINA_OPTS=$CATALINA_OPTS" -Djavax.net.ssl.trustStore=$JAVA_HOME/jre/lib/security/cacerts"
CATALINA_OPTS=$CATALINA_OPTS" -Djavax.net.ssl.trustStorePassword=changeit"
CATALINA_OPTS=$CATALINA_OPTS" -Djavax.net.ssl.trustStoreType=JKS"
#CATALINA_OPTS=$CATALINA_OPTS" -Djavax.net.debug=ssl"
export CATALINA_OPTS
if [ $# -gt 0 ]; then
  echo "Stopping TOMCAT..."
  $CATALINA_HOME/bin/shutdown.sh
else
  rm -rvf cas*.log perf*.log 2>/dev/null
  rm -vf $CATALINA_HOME/logs/* 2>/dev/null
  echo "Starting TOMCAT..."
  $CATALINA_HOME/bin/startup.sh
fi
