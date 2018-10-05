FROM ubuntu:latest

MAINTAINER Martin Navne

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libssl1.0.0 libssl-dev libasound2

COPY pjproject-2.7.2/pjsip-apps/bin/pjsua-x86_64-unknown-linux-gnu /app

EXPOSE 5060 5061

CMD ["./pjsua-x86_64-unknown-linux-gnu"]

