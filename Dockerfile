FROM debian:stretch

RUN apt-get update
RUN apt-get install -y build-essential gcc make cmake libcurl4-openssl-dev libxml2-dev libssl-dev libxml2 git

RUN git clone https://github.com/taganaka/SpeedTest
RUN cd SpeedTest && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make install && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/build /tmp/src

ENTRYPOINT ["/usr/local/bin/SpeedTest"]
