FROM ubuntu:16.04
RUN apt-get update -y && \
    apt-get install -y iputils-ping && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y nginx

ENV ENTRYKIT_VERSION 0.4.0
RUN curl -sSfL https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz | tar zxf - && \
    mv entrykit /bin/entrykit && \
    chmod +x /bin/entrykit && \
    entrykit --symlink

RUN rm /etc/nginx/sites-enabled/default
COPY files /

ENTRYPOINT [ \
  "render", \
    "/etc/nginx/conf.d/default.conf", \
  "--", \
  "switch", \
    "bash=/bin/bash", \
    "configtest=nginx -t",\
  "--", \
  "nginx", "-g", "daemon off;" \
]
