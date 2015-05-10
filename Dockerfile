#This Dockerfil is prepated to get your Python programming environment ready as instructed by ZED A. SHAW
FROM centos:centos7

MAINTAINER KD <kuldeeparyadotcom@gmail.com>

RUN yum -y update && yum -y install initscripts openssh openssh-server openssh-clients sudo passwd sed screen tmux byobu which vim-enhanced python 
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/ssh_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/ssh_config

RUN useradd admin -G wheel -s /bin/bash -m
RUN echo 'admin:welcome' | chpasswd
RUN echo '%WHEEL ALL=(ALL) ALL' >> /etc/sudoers

VOLUME ["/data"]

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
