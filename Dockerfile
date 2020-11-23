#Dockerfile
# #############################################################################
#
# Build image:
# >> docker build -t ldap_demon_nginx .
#
# Run container:
# >> docker run -it  --name ldap_demon_nginx <images name>
###############################################################################
FROM registry.redhat.io/rhel8/python-38
LABEL   maintainer="Test Testovich"

COPY nginx-ldap-auth-daemon.py /usr/src/app/

WORKDIR /usr/src/app/

USER root

#install
RUN \
    yum install -y openldap-devel && \
    pip install --upgrade pip && \
    pip install python-ldap



EXPOSE 8888

CMD ["python", "/usr/src/app/nginx-ldap-auth-daemon.py", "--host", "0.0.0.0", "--port", "8888"]