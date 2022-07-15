#!/bin/bash
JAVA_OPT="${JAVA_OPT} -Xms${JVM_XMS} -Xmx${JVM_XMX} -Xmn${JVM_XMN}"
JAVA_OPT="${JAVA_OPT} --spring.config.additional-location=${CUSTOM_SEARCH_LOCATIONS}"
JAVA_OPT="${JAVA_OPT} --spring.config.name=${CUSTOM_SEARCH_NAMES}"
JAVA_OPT="${JAVA_OPT} --server.max-http-header-size=524288"
echo "Sentinel is starting, you can docker logs your container"
exec $JAVA $JAVA_OPT
