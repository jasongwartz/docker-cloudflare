FROM arm32v6/alpine:3.6
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

COPY ["cloudflare-update-record.sh","config.example","/"]
COPY start.sh /start.sh

RUN if test ! -e /config; then mkdir /config; fi
RUN apk add --no-cache curl perl && \
	chmod +x /cloudflare-update-record.sh && \
	chmod +x /start.sh

WORKDIR /config

VOLUME /config

CMD ["/start.sh"]
