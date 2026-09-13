FROM ubuntu:24.04

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    git \
    patch \
    texinfo \
    flex \
    bison \
    libgsl-dev \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \ 
    wget \
    gettext \ 
    cmake \ 
    file

RUN rm -rf /var/lib/apt/lists/* 

ENV PS2DEV=/usr/local/ps2dev
RUN mkdir -p $PS2DEV 
ENV PS2DEV="/usr/local/ps2dev"
ENV PS2SDK="${PS2DEV}/ps2sdk"
ENV PATH="${PATH}:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin"
RUN mkdir -p "/opt/repos"
RUN mkdir -p /opt/repos && cd /opt/repos && git clone https://github.com/ps2dev/ps2toolchain.git
RUN cd /opt/repos/ps2toolchain && ./toolchain.sh
RUN cd /opt/repos && git clone https://github.com/ps2dev/ps2sdk.git
RUN cd /opt/repos/ps2sdk && make && make install
CMD ["/bin/bash"]
