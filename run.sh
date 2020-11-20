#!/bin/bash
# run nginx
/usr/sbin/nginx 
# run test_dash_srcipts
python3.7 app/app.py &
#run demon_auth_ldap
exec python3.7 app/nginx-ldap-auth-daemon.py
