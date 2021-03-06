FROM ubuntu:18.04


RUN apt-get update && \
 apt-get -y install apache2
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh

ENV DEVOPS="vynnyk"
RUN echo "Nazar Vynnyk env DEVOPS = $DEVOPS" > ./index.html
RUN mv ./index.html /var/www/html/index.html

COPY task3.sh task3.sh
RUN  chmod 777  task3.sh

EXPOSE 80
CMD ./task3.sh
#CMD /root/run_apache.sh
