#!/bin/bash
# run test_dash_srcipts
python3.7 app/app.py &
#run demon_auth_ldap
exec python3.7 nginx-ldap-auth-daemon.py &
exec /usr/sbin/nginx
