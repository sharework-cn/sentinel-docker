#!/bin/bash
docker build -t sharework.cn/sentinel:1.8.4-slim --build-arg SENTINEL_VERSION=1.8.4 \ 
    HOT_FIX_FLAG= \
    OPENJDK_VERSION=11 \
    OPENJDK_RUNTIME="-jre"  \
    OPENJDK_IMAGE="-slim" \
    .