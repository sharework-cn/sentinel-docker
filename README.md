# Sentinel Docker

![Docker Pulls](https://user-images.githubusercontent.com/9434884/43697219-3cb4ef3a-9975-11e8-9a9c-73f4f537442d.png)  

Version: 1.8.4

This project contains a Docker image meant to facilitate the deployment of [Sentinel](https://github.com/alibaba/Sentinel).

## Project directory

* build：Sentinel makes the source code of the docker image
* example: Kubernetes example Pod definition for Sentinel

## Quick Start

```shell
docker run --name sentinel -p 8080:8080 -d sharework.cn/sentinel:latest
```
## Login
Use the account and password of `"sentinel"`.
## Common property configuration
### Environment Variables

| name                          | description                            | option                                 |
| ----------------------------- | -------------------------------------- | -------------------------------------- |
| JVM_XMS      |  -Xms             | default :128m                          |
| JVM_XMX      |  -Xmx            | default :1g                          |
| JVM_XMN      |  -Xmn           | default :512m                          |
| TOMCAT_ACCESSLOG_ENABLED      |  server.tomcat.accesslog.enabled         | default :false                          |

### Custom Properties
Mount a configuration file(`custom.properties`) to the `/home/sentinel/conf`
## Logs
Please refer to the directory `/home/sentinel/logs`
