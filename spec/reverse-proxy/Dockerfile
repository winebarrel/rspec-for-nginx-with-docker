FROM ubuntu:16.04
RUN apt-get update -y && \
    apt-get install -y apt-transport-https && \
    echo 'deb https://dl.bintray.com/itamae/itamae xenial contrib' > /etc/apt/sources.list.d/itamae.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D401AB61 && \
    apt-get update -y && \
    apt-get install -y iputils-ping && \
    apt-get install -y net-tools && \
    apt-get install -y netcat && \
    apt-get install -y telnet && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y itamae

COPY itamae /itamae

RUN cd /itamae && \
    itamae local reverse-proxy.rb

CMD ["nginx", "-g", "daemon off;"]
