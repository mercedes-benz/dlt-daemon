# docker build -t genivi/dlt-daemon .
# docker run -it --rm -v /tmp:/tmp -p 3490:3490 genivi/dlt-daemon
# sudo chmod o+rw /tmp/dlt

FROM debian:stable-slim as builder

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    zlib1g-dev \
    libdbus-glib-1-dev

# Build and package from source
RUN git clone https://github.com/GENIVI/dlt-daemon.git
RUN cd dlt-daemon && \
    mkdir -p build && \
    cd build && \
    cmake .. && \
    cpack

FROM debian:stable-slim
COPY --from=builder /dlt-daemon/build/dlt_*.deb .
RUN dpkg -i dlt_*.deb && rm dlt_*.deb
CMD dlt-daemon
