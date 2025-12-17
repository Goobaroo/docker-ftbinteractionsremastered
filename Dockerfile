# syntax=docker/dockerfile:1

FROM eclipse-temurin:8-jre-noble

LABEL version="1.14.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Interactions Remastered"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/01/0144097bf4b6da506e72cdad785c719da1b70ed59bf65535fab71a53a23a0281.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Interactions-Remastered:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Interactions Remastered v1.14.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]