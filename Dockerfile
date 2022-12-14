FROM ubuntu:20.04

RUN sed -i'' 's/archive.ubuntu.com/jp.archive.ubuntu.com/' /etc/apt/sources.list && apt-get update -y

RUN apt-get install -y \
    openjdk-17-jre \
    openssh-server \
    init \
    systemd

RUN sed -i 's/#Port 22/Port 8000/' /etc/ssh/sshd_config

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:root' | chpasswd

EXPOSE 25565/tcp
EXPOSE 8000/tcp

CMD ["/sbin/init"]