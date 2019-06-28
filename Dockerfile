FROM alpine:latest

ARG UID
ARG GID
ARG RELEASE

ENV LANG C.UTF-8
ENV USER streama
ENV HOME /home/$USER
ENV RELEASE_URL https://github.com/streamaserver/streama/releases/download/v$RELEASE/streama-$RELEASE.jar
ENV STREAMA_JAR $HOME/bin/streama-$RELEASE.jar
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $HOME/bin:$PATH

WORKDIR $HOME

RUN addgroup -S $USER -g $GID \
    && adduser -S -G $USER -u $UID -h $HOME $USER \
    && apk add --no-cache \
    ca-certificates wget openjdk8 \
    && mkdir -p $(dirname $STREAMA_JAR) \
    && wget $RELEASE_URL -O $STREAMA_JAR \
    && chmod +x $STREAMA_JAR

COPY ./entrypoint.sh $HOME/bin

USER streama
EXPOSE 8080
CMD ["entrypoint.sh"]
