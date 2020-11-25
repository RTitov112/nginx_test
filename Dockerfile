#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t test .
#
# Run container:
# >> docker run -it  --name test_nginx18 test
#Stop-rebuld-run
#docker stop nginx_test_container; docker container rm -f nginx_test_container; docker image rm -f nginx_test; docker build --rm -t nginx_test .; docker run -p 8080:8080 -p 8443:8443 --name nginx_test_container nginx_test:latest
###############################################################################
FROM registry.redhat.io/rhel8/nginx-118
COPY . /usr/src/app/
LABEL   maintainer="Test Testovich"

WORKDIR /usr/src/app/
USER root

RUN mv /usr/src/app/nginx.conf /etc/nginx/nginx.conf && \
		mkdir -p  /etc/nginx/ssl && \
		mv /usr/src/app/nginx-selfsigned* /etc/nginx/ssl && \
        mkdir -p  /usr/share/nginx/cache/ && \
        chown -R nginx:nginx  /usr/share/nginx/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
