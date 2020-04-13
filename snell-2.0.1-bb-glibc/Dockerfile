FROM busybox:glibc
RUN SNELL_URL="https://github.com/F00cked/snell-server/raw/master/snell-2.0.1-bb-glibc/snell.tar.gz" && \
    TZDATA_URL="https://github.com/F00cked/tzdata/raw/master/Alpine/zoneinfo/Asia/Shanghai" && \
    wget --no-check-certificate -c ${SNELL_URL} -O - | tar -xz && \
    wget --no-check-certificate -O /etc/localtime ${TZDATA_URL}
ENTRYPOINT ["init.sh"]