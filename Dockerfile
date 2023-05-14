FROM alpine:3.18.0

RUN apk add --no-cache openssh

# SSH Server configuration file
COPY sshd_config /etc/ssh/sshd_config
COPY bin /bin
COPY data /data

RUN chmod +x /bin/* && \
    /bin/setup-user.sh

EXPOSE 22

ENTRYPOINT ["/bin/entrypoint.sh"]
