FROM ubuntu:20.04

WORKDIR /work

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
 
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bash-completion \
        curl \
        wget \
		tzdata \
        git \
        less \
        make \
		nano \
        tar \
        unzip \
        zip \
		python3-dev \
		ca-certificates \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        cmake \
		gcc-arm-none-eabi \
		libnewlib-arm-none-eabi \
		build-essential \
		libstdc++-arm-none-eabi-newlib \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN set -x \
    && git clone -b master https://github.com/raspberrypi/pico-sdk.git \
    && cd pico-sdk \
    && git submodule update --init \
    && cd .. \
    && git clone -b master https://github.com/raspberrypi/pico-examples.git
    
ENV PICO_SDK_PATH /work/pico-sdk
COPY blink /work/blink

# COPY gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 ./

# RUN apt update && \
#     apt install -y python python-pip git mercurial unzip nano && \
#     python -m pip install --upgrade pip==20.3.4 && \
#     python -m pip install mbed-cli jinja2 fuzzywuzzy jsonschema pyelftools && \
#     apt clean && \
#     rm -rf /root/.cache/pip

# RUN tar xvjf gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 -C /usr/local && \
#     rm *.bz2 && \
#     mbed config -G GCC_ARM_PATH /usr/local/gcc-arm-none-eabi-6-2017-q2-update/bin/

# ENV PATH /usr/local/gcc-arm-none-eabi-6-2017-q2-update/:$PATH
