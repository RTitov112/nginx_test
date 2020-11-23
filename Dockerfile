#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t test .
#
# Run container:
# >> docker run -it  --name test_nginx18 test

###############################################################################
FROM registry.redhat.io/rhel8/nginx-118
COPY . /usr/src/app/
LABEL   maintainer="Test Testovich"

WORKDIR /usr/src/app/
USER root

RUN mv /usr/src/app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["/bin/bash", "nginx"]