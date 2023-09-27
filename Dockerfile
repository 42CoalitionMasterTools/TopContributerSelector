FROM debian:latest

RUN set -eux \
	apt update \
	apt-get install jq;

CMD bash
