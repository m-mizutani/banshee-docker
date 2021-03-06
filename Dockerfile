FROM alpine:3.5
RUN apk update
RUN apk add --no-cache libpcap libpcap-dev msgpack-c msgpack-c-dev
RUN mkdir /opt/
WORKDIR /opt/

RUN rm -rf lib bin CMakeCache.txt CMakeFiles
RUN apk add --no-cache --virtual .build-deps git cmake clang automake alpine-sdk && \
		git clone --recursive https://github.com/m-mizutani/banshee.git && \
		cd banshee && \
		cmake . && \
		make install && \
		apk del .build-deps && \
		rm -rf /opt/banshee
RUN apk add libstdc++
ENTRYPOINT /usr/local/bin/banshee -i $NIC -f $LOG_DST
