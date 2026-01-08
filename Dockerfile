ARG VERSION=latest
FROM tailscale/tailscale:$VERSION
RUN apk add --no-cache jq
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]