FROM registry.access.redhat.com/ubi8/php-74:1-131

COPY ../../. /opt/app-root/src
USER 0
RUN chown -R 1001:0 /opt/app-root/src
USER 1001

CMD /usr/libexec/s2i/run
