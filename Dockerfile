FROM openjdk:11

ARG SENTINEL_VERSION=1.8.4

ENV BASE_DIR="/home/sentinel" \
    JAVA="java" \
    JVM_XMS="128m" \
    JVM_XMX="1g" \
    JVM_XMN="256m" \
    JVM_MS="64m" \
    JVM_MMS="160m" \
    TIME_ZONE="Asia/Shanghai"

ENV CLASSPATH=".:${BASE_DIR}/conf:$CLASSPATH" \
    JAVA_OPT="-jar ${BASE_DIR}/target/sentinel-dashboard-${SENTINEL_VERSION}.jar" 

WORKDIR $BASE_DIR
COPY sentinel-dashboard-$SENTINEL_VERSION.jar ${BASE_DIR}/target/sentinel-dashboard-${SENTINEL_VERSION}.jar
RUN mkdir -p logs \
	&& cd logs \
	&& touch start.out \
	&& ln -sf /dev/stdout start.out \
	&& ln -sf /dev/stderr start.out
COPY docker-startup.sh bin/docker-startup.sh
RUN chmod +x bin/docker-startup.sh
EXPOSE 8080
ENTRYPOINT ["bin/docker-startup.sh"]
