FROM ubuntu:18.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git-core gitk git-gui curl lvm2 thin-provisioning-tools python-pkg-resources python-virtualenv python-oauth2client gpg
ARG UID=1000
ARG H
RUN mkdir -p $(dirname $H) && \
    useradd -d $H -s /bin/bash -m cros -u $UID -G sudo && \
    echo cros:cros | chpasswd
RUN apt-get install sudo
COPY sudosetup.sh /tmp
RUN /tmp/sudosetup.sh
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /usr/local/depot_tools
ENV PATH=/usr/local/depot_tools:$PATH

USER cros
WORKDIR $H
