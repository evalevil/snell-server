#!/bin/sh
EXEC="/usr/bin/snell"
CONF="/usr/bin/snell-server.conf"
# reuse existing config when the container restarts
run() {
  if [ -f ${CONF} ]; then
    echo "Found existing config..."
  else
    if [ -z ${PSK} ]; then
      PSK=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 32)
      echo "Using PSK: ${PSK}"
    else
      echo "[snell-server]" >> ${CONF}
      echo "listen = 0.0.0.0:${PORT}" >> ${CONF}
      echo "psk = ${PSK}" >> ${CONF}
      echo "obfs = ${OBFS}" >> ${CONF}
    fi
      ${EXEC} -c ${CONF}
  fi
}
if [ -z "$@" ]; then
  run
else
  exec "$@"
fi