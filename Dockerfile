FROM ubuntu:bionic
LABEL maintainer "ittou <VYG07066@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get -y --no-install-recommends install \
    apt-utils \
    debconf \
    ca-certificates \
    curl \
    sudo \
    xorg \
    dbus \
    dbus-x11 \
    ubuntu-gnome-default-settings \
    gtk2-engines \
    gosu \
    ttf-ubuntu-font-family \
    fonts-ubuntu-font-family-console \
    fonts-droid-fallback \
    lxappearance \
    nautilus \
    vim \
    gnome-terminal \
    canberra-gtk* \
    language-pack-ja \
    tzdata \
    iputils-ping \
    net-tools \
    ncurses-dev \
    build-essential \
    autoconf \
    automake \
    gawk \
    make \
    libpython-dev \
    libpython3-dev \
    python-dev \
    python3-dev \
    tcl \
    tcl-dev \
    less \
    unzip \
    git && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm /etc/localtime && \
  ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata && \
  locale-gen ja_JP.UTF-8 && \
  rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8
ENV LANGAGE ja_JP.ja
ENV LC_ALL ja_JP.UTF-8
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash", "-l"]
