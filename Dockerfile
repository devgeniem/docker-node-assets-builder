FROM debian:jessie
MAINTAINER Onni Hakala - Geniem Oy. <onni.hakala@geniem.com>

RUN \
       cd /tmp/ \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        apt-transport-https \
        curl \
        ca-certificates \
        git \
        openssh-client \
        python \
        build-essential \
    # Install new nodejs
    && curl -sL https://deb.nodesource.com/setup_7.x | bash \
    && apt-get -y --no-install-recommends install nodejs \

    # Install yarn
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y install yarn \

    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /var/log/apt/* /var/log/*.log

# Install node-sass and webpack globally
RUN yarn global add node-sass webpack

# Install custom helper for one command building
COPY node_install_and_build_webpack.sh /usr/local/bin/node_install_and_build_webpack
RUN chmod +x /usr/local/bin/node_install_and_build_webpack

# Mount projects in here and run commands here too
WORKDIR /build
