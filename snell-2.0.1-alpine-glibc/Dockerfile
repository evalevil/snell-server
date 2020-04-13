FROM echoer/alpine:glibc
ARG SNELL_URL=https://github.com/surge-networks/snell/releases/download/v2.0.1/snell-server-v2.0.1-linux-amd64.zip
LABEL maintainer="echoer" \
      org.label-schema.name="snell-server"
ENV PORT=30102
COPY Entrypoint.sh /usr/bin/
RUN wget --no-check-certificate -O snell.zip $SNELL_URL && \
    unzip snell.zip && \
    rm -f snell.zip && \
    chmod +x snell-server && \
    mv snell-server /usr/bin/ && \
    chmod +x /usr/bin/Entrypoint.sh
ENTRYPOINT ["Entrypoint.sh"]