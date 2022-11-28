FROM alpine:edge

ARG AUUID="af0538c7-b444-44e3-8648-a4efba4c8720"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/cym31153/northflank-xray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
