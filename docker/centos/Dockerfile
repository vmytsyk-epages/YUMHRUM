FROM centos:6.7
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN yum -y install openssh-server epel-release && \
    yum -y install git-all && \
    yum -y install pwgen && \
    yum -y install which && \
    rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 8088
CMD ["/bin/bash"]
CMD ["/run.sh"]
