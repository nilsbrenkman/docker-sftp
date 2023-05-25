FROM alpine:3.18.0

RUN apk add --no-cache openssh bash && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY sshd/sshd_config /etc/ssh/
COPY entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
