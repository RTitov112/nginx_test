#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t test .
#
# Run container:
# >> docker run -it -p 8080:8080 -p 8888:8888 --user root --name test_nginx18 test
#	nginx-ldap-auth-daemon.py - demon script
#	app - dir test dash script
#	nginx.conf - test nginx conf file
#       bash_run_demon+test_dash.sh - start script
###############################################################################
FROM registry.redhat.io/ubi8/nginx-118
USER root
COPY . /usr/src/app/

WORKDIR /usr/src/app/

# Install required software
RUN \
    yum install -y  gcc openssl-devel bzip2-devel libffi-devel zlib-devel make openldap-devel 

# install python 3.7 from sours
RUN cd /usr/src/app/src && \
	tar xzf Python-3.7.9.tgz && \
	cd Python-3.7.9  && \
	./configure --enable-optimizations && \
	make altinstall

#install python module
RUN cd /usr/src/app && \
	pip3.7 install --upgrade pip && \
	pip3.7 install --no-cache-dir -r requirements.txt

# change nginx config 
RUN mv /usr/src/app/nginx.conf /etc/nginx/nginx.conf

# script start 
RUN chmod a+x run.sh 


EXPOSE 8080


CMD ["./run.sh"]

