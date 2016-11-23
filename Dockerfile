FROM alpine:edge
MAINTAINER Onni Hakala - Geniem Oy. <onni.hakala@geniem.com>

RUN cd /tmp/ && \

    # Install dependencies and small amount of devtools
    apk --update add wget curl bash less vim nano git openssh-client \
    # Node and build tools
    nodejs python build-base

# Symlink few scripts for easier usage
RUN ln -s /build/node_modules/webpack/bin/webpack.js /usr/local/bin/webpack

COPY node_install_and_build_webpack.sh /usr/local/bin/node_install_and_build_webpack
RUN chmod +x /usr/local/bin/node_install_and_build_webpack

# Mount projects in here and run commands here too
WORKDIR /build
