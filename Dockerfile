FROM ubuntu:bionic
LABEL maintainer "ittou <VYG07066@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get -y --no-install-recommends install \
    apt-utils ca-certificates curl sudo xorg dbus dbus-x11 ubuntu-gnome-default-settings \
    gtk2-engines gosu ttf-ubuntu-font-family fonts-ubuntu-font-family-console \
    fonts-droid-fallback lxappearance nautilus vim gnome-terminal \
    canberra-gtk* language-pack-ja tzdata && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*
RUN \
  echo "${TZ}" > /etc/timezone && \
  rm /etc/localtime && \
  ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGAGE ja_JP.ja
ENV LC_ALL ja_JP.UTF-8

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash", "-l"]
