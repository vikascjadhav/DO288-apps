FROM registry.access.redhat.com/ubi8/ubi:8.0

MAINTAINER Red Hat Training <training@redhat.com>

# DocumentRoot for Apache
ENV DOCROOT=/var/www/html 


RUN   yum install -y --nodocs --disableplugin=subscription-manager httpd && \
      yum clean all --disableplugin=subscription-manager -y && \
      echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html

# Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ ${DOCROOT}/

EXPOSE 8080

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd

RUN pwd && printf "RUn" &&  ls /var/run  && printf "\n varlog****\n" &&  ls /var/log &&    printf "\n ETC CONF **** \n" && cat /etc/httpd/conf/httpd.conf
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && sed -i 's/#ServerName www.example.com:80/ServerName 0.0.0.0:8080/g' /etc/httpd/conf/httpd.conf 
RUN chgrp -R  0 /var/run/httpd 
RUN  chgrp -R 0 /var/log/httpd/ 
RUN  chmod -R g=u /var/run/httpd 
RUN  chmod -R g=u /var/log/httpd/ 
# Run as the root user
USER 1001

# Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
