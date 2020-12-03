FROM ubuntu:hirsute
LABEL maintainer="Michael Caron" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y tzdata && \
    apt-get install -y software-properties-common
    
RUN add-apt-repository universe

RUN apt-get install -y --no-install-recommends\
                    python3 \
                    python3-pip \
                    git \
                    curl \
                    cmake \
                    gcc-9 \
                    g++ \
                    clang-10 \
                    build-essential \
                    cmake \
                    unzip \
                    tar \
                    ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install gcovr

CMD [ "mkdir", "build" ]
