FROM ubuntu:16.04
RUN apt-get update -y && \
    apt-get install -y openssl
RUN mkdir -p /demoCA/certs /demoCA/private /demoCA/crl /demoCA/newcerts
RUN chmod 700 /demoCA/private
RUN touch /demoCA/index.txt
RUN echo 01 > /demoCA/serial
COPY root.crt /demoCA/cacert.pem
COPY root.key /demoCA/private/cakey.pem
RUN sed -i 's|./demoCA|/demoCA|' /usr/lib/ssl/openssl.cnf
RUN sed -i 's|default_days.*|default_days = 3650|' /usr/lib/ssl/openssl.cnf
