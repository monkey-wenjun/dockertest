M hub.c.163.com/public/centos:7.2.1511
RUN yum clean all
RUN yum install -y yum-plugin-ovl || true
RUN yum install -y vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cronie python-setuptools
RUN yum clean all
RUN easy_install supervisor
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 22
RUN mkdir -p /etc/supervisor/conf.d/
RUN /usr/bin/echo_supervisord_conf > /etc/supervisord.conf
RUN echo [include] >> /etc/supervisord.conf
RUN echo 'files = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf
COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
CMD ["/usr/bin/supervisord"]

