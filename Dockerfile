FROM lscr.io/linuxserver/webtop:alpine

ENV PUID=1000 \
    PGID=1000 \
    TZ=Etc/UTC \
    CHROME_FLAGS="--disable-dev-shm-usage --js-flags=--max-old-space-size=128" \
    NODE_OPTIONS="--max-old-space-size=128"

USER root

# Minimal tools only (optional)
RUN apk add --no-cache \
    bash \
    curl \
    wget \
    python3 \
    py3-pip \
    procps \
    earlyoom

# Start earlyoom automatically
RUN rc-update add earlyoom default || true

EXPOSE 3000
EXPOSE 3001

VOLUME ["/config"]
