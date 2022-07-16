ARG SENTINEL_VERSION=1.8.4
ARG HOT_FIX_FLAG=""
ARG OPENJDK_VERSION=11-jre-slim
FROM amd64/buildpack-deps:buster-curl as installer



RUN set -x \
    && mkdir -p /home/sentinel/target \
    && curl -SL --output /home/sentinel/target/sentinel-dashboard.jar https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}${HOT_FIX_FLAG}/sentinel-dashboard-${SENTINEL_VERSION}.jar

FROM openjdk:${OPENJDK_VERSION}
LABEL org.opencontainers.image.authors="sharework@qq.com" \
    org.opencontainers.image.licenses="GPL-2.0-only" \
    org.opencontainers.image.title="Alibaba Sentinel Image" \
    org.opencontainers.image.vendor="sharework.cn"

# set environment
ENV BASE_DIR="/home/sentinel" \
    CLASSPATH=".:/home/sentinel/conf:$CLASSPATH" \
    JAVA_HOME="/usr/local/openjdk-11" \
    JAVA="/usr/local/openjdk-11/bin/java" \
    JVM_XMS="128m" \
    JVM_XMX="128m" \
    JVM_XMN="64m" \
    TOMCAT_ACCESSLOG_ENABLED="false" \
    TIME_ZONE="Asia/Shanghai"

WORKDIR $BASE_DIR

RUN set -x \
    && mkdir -p logs \
    && mkdir -p target \
    && mkdir -p conf \
    && mkdir -p init.d \
    && mkdir -p bin \
    && cd logs \
	&& touch std.out \
    && touch std.err \
	&& ln -sf /dev/stdout std.out \
	&& ln -sf /dev/stderr std.err

ADD bin/docker-startup.sh bin/docker-startup.sh
ADD conf/application.properties conf/application.properties
RUN chmod +x bin/docker-startup.sh

# copy sentinel bin
COPY --from=installer ["/home/sentinel/target", "/home/sentinel/target"]

ADD bin/docker-startup.sh bin/docker-startup.sh
ADD conf/application.properties conf/application.properties

RUN chmod +x bin/docker-startup.sh

EXPOSE 8080
ENTRYPOINT ["bin/docker-startup.sh"]
