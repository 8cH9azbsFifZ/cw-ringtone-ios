FROM debian:buster-slim

MAINTAINER Gerolf Ziegenhain "gerolf.ziegenhain@gmail.com"

RUN apt-get update
RUN apt-get -y install ebook2cw ffmpeg
RUN apt-get -y install build-essential
RUN apt-get -y install yasm
RUN apt-get -y install git

#https://gist.github.com/rafaelbiriba/7f2d7c6f6c3d6ae2a5cb
RUN apt-get -y install autoconf automake build-essential git-core libass-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libvdpau-dev libvorbis-dev libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev libmp3lame-dev nasm gcc yasm && true

RUN git clone git://git.libav.org/libav.git

RUN mkdir ~/ffmpeg_sources; cd ~/ffmpeg_sources; git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git; cd fdk-aac; autoreconf -fiv; ./configure --prefix="$HOME/ffmpeg_build" --disable-shared; make -j8; make install; make distclean
RUN apt-get -y install wget
RUN cd ~/ffmpeg_sources; wget https://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz; tar xzvf lame-3.99.5.tar.gz; cd lame-3.99.5; ./configure --prefix="$HOME/ffmpeg_build" --enable-nasm --disable-shared; make -j8; make install; make distclean

RUN cd ~/ffmpeg_sources; wget https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.gz; tar xzvf ffmpeg-4.2.1.tar.gz; cd ffmpeg-4.2.1; PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig"; export PKG_CONFIG_PATH; ./configure --prefix="$HOME/ffmpeg_build" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac \
  --enable-libmp3lame --enable-nonfree; make -j8; make install; cp ffmpeg /usr/bin/; make distclean; hash -r
RUN ffmpeg 2>&1 | head -n1

# libfdk-aac-dev (non-free)

# https://coderwall.com/p/df1hwg/create-iphone-ringtones-with-ffmpeg
RUN mkdir /data
ADD makeringtone.sh  /bin

VOLUME /data
WORKDIR /data

ENV TEXT="test"

ENTRYPOINT /bin/makeringtone.sh
