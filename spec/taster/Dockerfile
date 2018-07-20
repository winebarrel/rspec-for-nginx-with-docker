FROM ubuntu:16.04
RUN apt-get update -y && \
    apt-get install -y iputils-ping && \
    apt-get install -y net-tools && \
    apt-get install -y netcat && \
    apt-get install -y telnet && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y build-essential && \
    apt-get install -y ruby && \
    apt-get install -y ruby-dev && \
    apt-get install -y libxml2-dev && \
    apt-get install -y libxslt1-dev && \
    apt-get install -y zlib1g-dev && \
    gem install --no-document infrataster

COPY ssl/root.crt /usr/share/ca-certificates/
RUN echo root.crt >> /etc/ca-certificates.conf
RUN update-ca-certificates
