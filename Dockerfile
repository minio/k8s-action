FROM alpine:3.12

RUN \
     apk add --no-cache ca-certificates 'curl>7.61.0' && \
     echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
     curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
     chmod +x ./kubectl && \
     mv -f ./kubectl /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
