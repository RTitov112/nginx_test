#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t test .
#
# Run container:
# >> docker run -it -p 8080:8080 -p 8888:8888 --user root --name test_nginx18 test
#	nginx-ldap-auth-daemon.py - demon script
#	nginx-ldap-auth.default - default config
#	nginx-ldap-auth.logrotate -logrotate config
###############################################################################
FROM registry.redhat.io/ubi8/nginx-118
USER root
COPY . /usr/src/app/

WORKDIR /usr/src/app/

# Install required software
RUN \
    yum install -y  git openldap-devel python38 python38-devel python38-setuptools python38-pip gcc  && \
    pip3 install python-ldap

EXPOSE 8888 8080


CMD ["python3", "/usr/src/app/nginx-ldap-auth-daemon.py", "--host", "0.0.0.0", "--port", "8888"]
