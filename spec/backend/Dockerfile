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
    gem install mime-types --no-document

COPY files /

CMD ["/backend.rb"]
