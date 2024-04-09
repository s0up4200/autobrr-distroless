# Fetcher stage
FROM alpine:latest AS fetcher

RUN apk add --no-cache wget curl

RUN LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/autobrr/autobrr/releases/latest | grep browser_download_url | grep linux_x86_64 | cut -d\" -f4) && \
    wget $LATEST_RELEASE_URL -O autobrr_latest.tar.gz && \
    tar xzf autobrr_latest.tar.gz -C /usr/local/bin/ && \
    mkdir /config && \
    chown nobody:nogroup /config && \
    chmod 755 /config

FROM gcr.io/distroless/static-debian12:nonroot

LABEL org.opencontainers.image.source = "https://github.com/s0up4200/autobrr-distroless"
LABEL org.opencontainers.image.licenses = "MIT"
LABEL org.opencontainers.image.base.name="gcr.io/distroless/static-debian12:nonroot"

COPY --from=fetcher /usr/local/bin/autobrr /usr/local/bin/
COPY --from=fetcher /config /config

WORKDIR /config

EXPOSE 7441

ENTRYPOINT ["autobrr", "run", "--config", "/config/"]
