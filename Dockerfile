ARG ALPINE_VERSION=3.16
FROM alpine:${ALPINE_VERSION}
RUN apk add iputils \
  curl \
  bind-tools \
  iperf \
  iperf3 \
  iproute2 \
  tcpdump \
  tcptraceroute

RUN mkdir -p /opt/your-folder && \
    adduser --disabled-password nonRootUser -u 1001 && \
    chown -R nonRootUser:nonRootUser /opt/your-folder

RUN setcap cap_net_raw+ep /usr/bin/tcpdump
RUN setcap cap_net_raw+ep /bin/ping

USER 1001

ENTRYPOINT ["tail", "-f", "/dev/null"]
