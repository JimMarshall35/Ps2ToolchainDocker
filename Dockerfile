FROM ghcr.io/ps2dev/ps2dev:latest

RUN apk add --no-cache \
    make \
    bash \
    cmake \
    vim
    
CMD ["/bin/bash"]
