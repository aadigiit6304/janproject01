FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install git httpd zip unzip -y
RUN git clone --single-branch -b main https://github.com/aadigiit6304/final.git /var/www/html/final
WORKDIR /var/www/html
RUN cp -rf final/* /var/www/html &&\
    rm -rf final &&\
    touch hello
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] 
