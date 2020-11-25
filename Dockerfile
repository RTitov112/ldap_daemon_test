#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t ldap_demon_nginx .
#
# Run container:
#docker run -p 8080:8080 -p 8443:8443 --name ldap_daemon_test_container ldap_daemon_test:latest
#Stop-rebuld-run
#docker stop ldap_daemon_test_container; docker container rm -f ldap_daemon_test_container; docker image rm -f ldap_daemon_test; docker build --rm -t ldap_daemon_test .; docker run -p 8888:8888 --name ldap_daemon_test_container ldap_daemon_test:latest
###############################################################################
FROM registry.redhat.io/rhel8/python-38
LABEL   maintainer="Test Testovich"

COPY . /usr/src/app/

WORKDIR /usr/src/app/

USER root

#install
RUN \
    yum install -y openldap-devel && \
    pip install --upgrade pip && \
    pip install python-ldap && \
	mv /usr/src/app/ssl/ca.crt /etc/pki/ca-trust/source/anchors/ && \
	update-ca-trust extract && \
	echo TLS_REQCERT allow >> /etc/openldap/ldap.conf



EXPOSE 8888

CMD ["python", "/usr/src/app/nginx-ldap-auth-daemon.py", "--host", "0.0.0.0", "--port", "8888"]