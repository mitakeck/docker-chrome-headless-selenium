FROM alpine:edge

RUN apk add --update \
            bash \
            udev \
            ttf-freefont \
            chromium \
            chromium-chromedriver

RUN mkdir -p /root/noto

WORKDIR /root/noto

# Fonts
RUN wget https://noto-website.storage.googleapis.com/pkgs/Noto-unhinted.zip && \
    unzip Noto-unhinted.zip
RUN mkdir -p /usr/share/fonts/noto && \
    cp *.otf /usr/share/fonts/noto/ && \
    chmod 644 -R /usr/share/fonts/noto && \
    fc-cache -f -v

# keep running
ENTRYPOINT tail -f /dev/null
