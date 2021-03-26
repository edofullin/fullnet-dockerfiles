FROM ubuntu

WORKDIR /srv

RUN apt update && DEBIAN_FRONTEND="noninteractive" apt-get install -y libsane-dev libjpeg-dev libpng-dev libavahi-client-dev libusb-1.*-dev git cmake g++ avahi-daemon git cmake g++ sane-utils
COPY scripts /srv/scripts

RUN git clone https://github.com/SimulPiscator/AirSane.git /srv/airsane
RUN cd /srv/airsane
RUN mkdir build && cd build
RUN cmake /srv/airsane
RUN make
RUN make install

RUN chmod +x /srv/scripts/*

EXPOSE 8090-8100
ENTRYPOINT [ "/srv/scripts/runtime.sh" ]
