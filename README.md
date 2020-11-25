# ldap_daemon
ldap_daemon_nginx
# ldap_daemon_test
docker stop ldap_daemon_test_container; 
docker container rm -f ldap_daemon_test_container; 
docker image rm -f ldap_daemon_test; 
docker build --rm -t ldap_daemon_test .; 
docker run -p 8888:8888 --name ldap_daemon_test_container ldap_daemon_test:latest
