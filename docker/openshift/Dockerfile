FROM registry.access.redhat.com/ubi8/php-74:1-131

# Fetch the required certificate for the Azure MySQL flexible server service
USER 0
ENV AZURE_SQL_SSL_CA_PATH=/etc/pki/tls/certs/DigiCertGlobalRootCA.crt.pem
RUN wget https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem -O $AZURE_SQL_SSL_CA_PATH

COPY . /opt/app-root/src
#USER 0
#RUN chown -R 1001:0 /opt/app-root/src
#USER 1001

CMD ["/usr/libexec/s2i/run"]
