# credit : inpyjama.com.

FROM ubuntu:latest

ARG USER_NAME="ashishk"
ARG USER_PASSWORD="root"

RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME
RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME
RUN adduser $USER_NAME sudo

RUN apt-get update
RUN apt-get install --no-install-recommends -y gcc
WORKDIR /workspaces/docker-c/c-code
COPY ./* .
CMD ["gcc", "src/main.c", "-Iinc", "-o", "application"]
# CMD ["pwd"]