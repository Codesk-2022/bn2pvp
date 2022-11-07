FROM ubuntu:kinetic

ARG USER=ubuntu
ARG PASSWD=

RUN apt update -y
RUN apt install -y \
    openjdk-17-jre \
    openssh-server \
    init \
    systemd \
    systemctl \

RUN sed -i 's/#Port 22/Port 8000/' /etc/ssh/sshd_config

RUN echo 'root:bn2pvp' | chpasswd
RUN useradd -m -s /bin/bash ${USER} && gpasswd -a ${USER} sudo
RUN echo '${USER}:${PASSWD}' | chpasswd

EXPOSE 25565/tcp 8000/tcp

CMD ["/sbin/init"]