FROM elixir:1.12.0

#    && apt-get install inotify-tools build-base git ffmpeg ffmpeg-dev npm nodejs file-dev libpng-dev gifsicle optipng libjpeg-turbo-utils librsvg imagemagick postgresql-client wget erlang-debugger wxgtk3 erlang-wx \
RUN apt-get update \
    && apt-get install -y libmagic-dev libavformat-dev libswscale-dev libjpeg-turbo-progs inotify-tools git ffmpeg npm nodejs libpng-dev gifsicle optipng imagemagick postgresql-client wget erlang-debugger erlang-wx \
    && mix local.hex --force \
    && mix local.rebar --force




RUN     apt-get install -y x11vnc xvfb xfwm4 dbus-x11
RUN     mkdir ~/.vnc
RUN     x11vnc -storepasswd 4492 ~/.vnc/passwd




ADD https://api.github.com/repos/philomena-dev/cli_intensities/git/refs/heads/master /tmp/cli_intensities_version.json
RUN git clone https://github.com/philomena-dev/cli_intensities /tmp/cli_intensities \
    && cd /tmp/cli_intensities \
    && make -j$(nproc) install

ADD https://api.github.com/repos/philomena-dev/mediatools/git/refs/heads/master /tmp/mediatools_version.json
RUN git clone https://github.com/philomena-dev/mediatools /tmp/mediatools \
    && cd /tmp/mediatools \
    && make -j$(nproc) install

COPY docker/app/run-development /usr/local/bin/run-development
COPY docker/app/run-test /usr/local/bin/run-test
COPY docker/app/safe-rsvg-convert /usr/local/bin/safe-rsvg-convert
COPY docker/app/purge-cache /usr/local/bin/purge-cache



#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    mkdir -p /etc/sudoers.d && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer
#
#USER developer
#ENV HOME /home/developer



CMD run-development
