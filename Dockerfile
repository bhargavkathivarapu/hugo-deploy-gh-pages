FROM debian:buster-slim
LABEL maintainer="Ben Selby <benmatselby@gmail.com>"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	ca-certificates  \
	curl \
	wget \
	tar \
	git && \
	rm -rf /var/lib/apt/lists/* && \
	wget https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz && \
	tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz && \
	rm go1.15.6.linux-amd64.tar.gz && \
	export PATH=$PATH:/usr/local/go/bin
	
COPY action.sh /usr/bin/action.sh

ENTRYPOINT ["action.sh"]
